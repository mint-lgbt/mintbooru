# frozen_string_literal: true

class ProfileComponent < ViewComponent::Base
  def initialize(user:)
    @user = User.find(user)
  end
end
