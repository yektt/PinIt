require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  
  test 'changing the associated pin for a comment' do
    pin = Pin.new title: 'coffee with friends'
    pin.save!

    comment1 = Comment.new body: "I'd like to come with you", pin: pin
    comment1.save

    pin2 = Pin.new title: 'tea with friends'
    pin2.save

    comment1.pin = pin2
    comment1.save

    refute_equal pin, comment1.pin
  end

end
