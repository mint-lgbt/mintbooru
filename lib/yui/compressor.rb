# frozen_string_literal: true

require 'English'
require 'rbconfig'
require 'shellwords'
require 'stringio'
require 'tempfile'

module YUI
  class Compressor
    VERSION = '0.12.1'

    class Error < StandardError; end

    class OptionError   < Error; end

    class RuntimeError  < Error; end

    attr_reader :options

    def self.default_options
      { charset: 'utf-8', line_break: nil }
    end

    def self.compressor_type
      raise Error, 'create a CssCompressor or JavaScriptCompressor instead'
    end

    def initialize(options = {})
      @options = self.class.default_options.merge(options)
      @command = [path_to_java]
      @command.push(*java_opts)
      @command.push('-jar')
      @command.push(path_to_jar_file)
      @command.push(*(command_option_for_type + command_options))
      @command.compact!
    end

    def command
      escaped_cmd = if RbConfig::CONFIG['host_os'] =~ /mswin|mingw/
                      # Shellwords is only for bourne shells, so windows shells get this
                      # extremely remdial escaping
                      @command.map do |word|
                        word = '\'%s\'' % word if word =~ / /

                        word
                      end
                    else
                      @command.map { |word| Shellwords.escape(word) }
                    end

      escaped_cmd.join(' ')
    end

    def compress(stream_or_string)
      streamify(stream_or_string) do |stream|
        tempfile = Tempfile.new('yui_compress')
        tempfile.write stream.read
        tempfile.flush
        full_command = format('%s %s', command, tempfile.path)

        begin
          output = `#{full_command}`
        rescue Exeception => e
          # windows shells tend to blow up here when the command fails
          raise 'compression failed: %s' % e.message
        ensure
          tempfile.close!
        end

        if $CHILD_STATUS.exitstatus.zero?
          output
        else
          # Bourne shells tend to blow up he when the command fails, usually
          # because java is missing
          raise 'Command \'%s\' returned non-zero exit status' %
                full_command
        end
      end
    end

    private

    def command_options
      options.inject([]) do |command_options, (name, argument)|
        method = begin
          method(:"command_option_for_#{name}")
        rescue NameError
          raise OptionError, "undefined option #{name.inspect}"
        end

        command_options.concat(method.call(argument))
      end
    end

    def path_to_java
      options.delete(:java) || 'java'
    end

    def java_opts
      options.delete(:java_opts).to_s.split(/\s+/)
    end

    def path_to_jar_file
      options.delete(:jar_file) || File.join(File.dirname(__FILE__), *%w[.. yuicompressor-2.4.8.jar])
    end

    def streamify(stream_or_string)
      if stream_or_string.respond_to?(:read)
        yield stream_or_string
      else
        yield StringIO.new(stream_or_string.to_s)
      end
    end

    def command_option_for_type
      ['--type', self.class.compressor_type.to_s]
    end

    def command_option_for_charset(charset)
      ['--charset', charset.to_s]
    end

    def command_option_for_line_break(line_break)
      line_break ? ['--line-break', line_break.to_s] : []
    end
  end

  class CssCompressor < Compressor
    def self.compressor_type
      'css'
    end

    def initialize(options = {})
      super
    end
  end

  class JavaScriptCompressor < Compressor
    def self.compressor_type
      'js'
    end

    def self.default_options
      super.merge(
        munge: false,
        optimize: true,
        preserve_semicolons: false
      )
    end

    def initialize(options = {})
      super
    end

    private

    def command_option_for_munge(munge)
      munge ? [] : ['--nomunge']
    end

    def command_option_for_optimize(optimize)
      optimize ? [] : ['--disable-optimizations']
    end

    def command_option_for_preserve_semicolons(preserve_semicolons)
      preserve_semicolons ? ['--preserve-semi'] : []
    end
  end
end
