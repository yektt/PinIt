require 'test_helper'

class PinTest < ActiveSupport::TestCase

  test 'changing the title' do
    pin = Pin.new title: 'title of the pin'
    pin.save!

    updated_at = pin.updated_at

    pin.title = 'new title of the pin'

    assert pin.save!
    refute_equal pin.updated_at, updated_at
  end

end
