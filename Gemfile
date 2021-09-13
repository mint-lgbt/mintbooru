# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.3'

# bcrypt() is a sophisticated and secure hash algorithm designed by The OpenBSD project
gem 'bcrypt', '~> 3.1', '>= 3.1.16'
# Boot large ruby/rails apps faster
gem 'bootsnap', '~> 1.8', '>= 1.8.1', require: false
# Flexible authentication solution for Rails with Warden
gem 'devise', github: 'lunaisnotaboy/devise'
# High-level wrapper for processing images for the web with ImageMagick or libvips
gem 'image_processing', '~> 1.12', '>= 1.12.1'
# Bundle and transpile JavaScript in Rails with esbuild, rollup.js, or Webpack
gem 'jsbundling-rails', '~> 0.1.4'
# PG is the Ruby interface to the PostgreSQL RDBMS
gem 'pg', '~> 1.2', '>= 1.2.3'
# Puma is a simple, fast, threaded, and highly concurrent HTTP 1.1 server for Ruby
gem 'puma', '~> 5.4'
# Ruby on Rails is a full-stack web framework optimized for programmer happiness
gem 'rails', github: 'rails/rails', branch: 'main'
# A Ruby client that tries to match Redis' API one-to-one
gem 'redis', '~> 4.4'
# Integrate SassC-Ruby into Rails
gem 'sassc-rails', '~> 2.1', '>= 2.1.2'
# Shrine is a toolkit for file attachments in Ruby applications
gem 'shrine', '~> 3.4'
# A modest JavaScript framework for the HTML you already have
gem 'stimulus-rails', '~> 0.5.1'
# Terser minifies JavaScript files by wrapping TerserJS to be accessible in Ruby
gem 'terser', '~> 1.1', '>= 1.1.5'
# The speed of a single-page web application without having to write any JavaScript
gem 'turbo-rails', '~> 0.7.11'
# TZInfo::Data contains data from the IANA Time Zone database
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
# View components for Rails
gem 'view_component', '~> 2.40'

group :development, :test do
  # Byebug is a Ruby debugger
  gem 'byebug', '~> 11.1', '>= 11.1.3', platforms: %i[mri mingw x64_mingw]
  # RuboCop is a Ruby code style checking and code formatting tool
  gem 'rubocop', '~> 1.20'
  # Automatic Rails code style checking tool
  gem 'rubocop-rails', '~> 2.12', '>= 2.12.2'
end

group :development do
  # Annotates Rails/ActiveRecord Models, routes, fixtures, and others
  gem 'annotate', '~> 3.1', '>= 3.1.1'
  # Preloads your application so things like console, rake and tests run faster
  gem 'spring', '~> 3.0'
  # A debugging tool for your Ruby on Rails applications
  gem 'web-console', '~> 4.1'
end

group :test do
  # Capybara is an integration testing tool for rack based web applications
  gem 'capybara', '~> 3.35', '>= 3.35.3'
  # WebDriver is a tool for writing automated tests of websites
  gem 'selenium-webdriver', '~> 3.142', '>= 3.142.7'
  # Run Selenium tests more easily with install and updates for all supported webdrivers
  gem 'webdrivers', '~> 4.6', '>= 4.6.1'
end
