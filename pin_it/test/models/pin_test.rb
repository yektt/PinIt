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

  test 'updated_at is changed after updating title' do
    pin = Pin.new title: 'title of the pin'
    pin.save!

    first_updated_at = pin.updated_at

    pin.title = 'new title of the pin'
    pin.save!

    refute_equal(pin.updated_at, first_updated_at)
  end

  test 'updated_at is changed after updating tag' do
    pin = Pin.new title:'title of the pin', tag: 'tags for the pin'
    pin.save!
    first_updated_at = pin.updated_at 
    pin.tag = 'new tags for the pin'
    pin.save!
    refute_equal(pin.updated_at, first_updated_at)
  end

  test 'updated_at is changed after updating image_url' do
    pin = Pin.new title: 'title of the pin',
                    image_url: 'http://fpoimg.com/255x170'
    pin.save!
    first_updated_at = pin.updated_at
    pin.image_url = 'http://fpoimg.com/250x250?text=Medium Rectangle'
    pin.save!
    refute_equal(pin.updated_at, first_updated_at)
  end

end
