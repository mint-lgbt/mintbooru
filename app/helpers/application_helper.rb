# frozen_string_literal: true

module ApplicationHelper
  def git_hash
    `git rev-parse HEAD`.chomp
  end

  def meta_description
    @page_description || 'mintbooru is an imageboard for all types of art. Whether it\'s digital, traditional, photography, cosplay, or something else, it\'s welcome here.'
  end

  def page_title
    @page_title || 'An imageboard that\'s a little more social'
  end
end
