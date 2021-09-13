# frozen_string_literal: true

class NoticeComponent < ViewComponent::Base
  def initialize(content:)
    @content = content
  end
end
