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

  test 'the first empty Pin created is first in the list' do
    first_pin = Pin.new title: 'first pin'
    first_pin.save!

    second_pin = Pin.new title: 'Second pin'
    second_pin.save!

    assert_equal(first_pin, Pin.all.first)
  end


end
