# frozen_string_literal: true

require 'test_helper'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include SystemTestHelp
  driven_by :selenium, using: :headless_firefox, screen_size: [1400, 1400]

  setup do
    skip 'Firefox not installed' unless system('firefox --version > /dev/null')
  end
end
