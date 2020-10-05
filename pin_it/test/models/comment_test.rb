require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  
  test 'changing the associated pin for a comment' do
    pin = Pin.new title: 'coffee with friends'
    pin.save!

    comment1 = Comment.new body: "I'd like to come with you", 
                           pin: pin,
                           user: User.new
    comment1.save

    pin2 = Pin.new  title: 'tea with friends'
    pin2.save

    comment1.pin = pin2
    comment1.save

    refute_equal pin, comment1.pin
  end

  test 'cascading save' do
    pin = Pin.new title: 'coffee with friends'
    pin.save!
    
    comment1 = Comment.new body: "I'd like to come with you", 
                           pin: pin,
                           user: User.new
    pin.comments << comment1
    pin.save!

    assert_equal comment1, Comment.first
  end 

  test 'Comments are ordered correctly' do
    pin = Pin.new title: 'coffee with friends'
    pin.save!

    comment1 = Comment.new body: "I'd like to come with you",
                           user: User.new

    comment2 = Comment.new body: "I agree! I'd like to do this as well", 
                           user: User.new

    pin.comments << comment1
    pin.comments << comment2
    pin.save!
    
    assert_equal comment1, pin.comments.first
    assert_equal pin.comments.count, 2
  end

end
