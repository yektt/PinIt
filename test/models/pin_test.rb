require 'test_helper'

class PinTest < ActiveSupport::TestCase
  test 'changing the title' do
    pin = Pin.new title: 'title of the pin', user: User.new
    pin.save!

    updated_at = pin.updated_at

    pin.title = 'new title of the pin'

    assert pin.save!
    refute_equal pin.updated_at, updated_at
  end

  test 'the first empty Pin created is first in the list' do
    first_pin = Pin.new title: 'first pin', user: User.new
    first_pin.save!

    second_pin = Pin.new title: 'Second pin', user: User.new
    second_pin.save!

    assert_equal(first_pin, Pin.all.first)
  end

  test 'updated_at is changed after updating title' do
    pin = Pin.new title: 'title of the pin', user: User.new
    pin.save!

    first_updated_at = pin.updated_at

    pin.title = 'new title of the pin'
    pin.save!

    refute_equal(pin.updated_at, first_updated_at)
  end

  test 'updated_at is changed after updating tag' do
    pin = Pin.new title:'title of the pin', tag: 'tags for the pin', user: User.new
    pin.save!
    first_updated_at = pin.updated_at 
    pin.tag = 'new tags for the pin'
    pin.save!
    refute_equal(pin.updated_at, first_updated_at)
  end

  test 'updated_at is changed after updating image_url' do
    pin = Pin.new title: 'title of the pin',
                    image_url: 'http://fpoimg.com/255x170', user: User.new
    pin.save!
    first_updated_at = pin.updated_at
    pin.image_url = 'http://fpoimg.com/250x250?text=Medium Rectangle'
    pin.save!
    refute_equal(pin.updated_at, first_updated_at)
  end

  test 'one matching result from search' do
    pin = Pin.new title: 'title of the pin', user: User.new
    pin.save!

    assert_equal Pin.search('title').length, 1
  end

  test 'no matching results' do
    pin1 = Pin.new title: 'title for the pin', user: User.new
    pin1.save!

    assert_empty Pin.search('newtitle')
  end

  test 'two matching results' do
    pin1 = Pin.new title: 'title1 for the pin', user: User.new
    pin1.save!

    pin2 = Pin.new title: 'title2 for the pin', user: User.new
    pin2.save!

    assert_equal Pin.search('title').length, 2
  end

  test 'most_recent with no Pin' do
    assert_empty Pin.most_recent()
  end

  test 'most_recent with two Pins' do
    pin_1 = Pin.new title: 'title1 for the pin', user: User.new
    pin_1.save!

    pin_2 = Pin.new title: 'title2 for the pin', user: User.new
    pin_2.save!

    assert_equal Pin.most_recent().length, 2
    assert_equal Pin.most_recent.first, pin_2
  end

  test 'most_recent with eight Pins' do
    8.times do |i|
      pin = Pin.new title: "title#{i+1} for the pin", user: User.new
      pin.save!
    end

    assert_equal Pin.most_recent().length, 6
    assert_equal Pin.most_recent.first.title, "title8 for the pin"
  end

  test 'search with title' do
    pin = Pin.new title: 'title for the pin', user: User.new
    pin.save!

    assert_equal Pin.search('title').length, 1
  end  
  
  test 'search with tag' do
    pin = Pin.new title: 'title for the pin',
                  tag: 'tags for the pin', user: User.new
    pin.save!

    assert_equal Pin.search('tag').length, 1
  end  

  test 'search with tag and title' do
    pin1 = Pin.new title: 'title1 for the pin',
                   tag: 'I am helping to title2', user: User.new
    pin1.save!

    pin2 = Pin.new title: 'title2 for the pin',
                   tag: 'I am helping to title1', user: User.new
    pin2.save!
    
    assert_equal Pin.search('title2').length, 2
  end

  test 'presence of the title' do
    pin = Pin.new
    refute pin.valid?
  end

  test 'maximum lenght of the tag' do
    pin = Pin.new title: 'title of the pin',
                    tag: 'this tag has more than thirty characters in it.', user: User.new
    refute pin.valid?
  end
end
