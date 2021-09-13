# frozen_string_literal: true

class AlertComponent < ViewComponent::Base
  def initialize(content:)
    @content = content
  end
end
