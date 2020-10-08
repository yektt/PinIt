require "application_system_test_case"

class PinCommentsTest < ApplicationSystemTestCase
  test 'adding a comment to an pin' do
    user = User.new email: 'test@mail'
    user.save!

    pin = Pin.new title: 'title', user: user
    pin.save

    visit(new_user_path)
    fill_in('Email', with: user.email)
    click_on('Log in', match: :first)

    click_on('Home', match: :first)

    sleep(5.second)
    click_on('title')
    fill_in('Add a comment', with: 'comment')
    click_on('Post', match: :first)

    assert_equal pin_path(pin), page.current_path
    assert page.has_content? ('comment')
  end

  test 'comments cannot be added when you not logged in' do
    pin = Pin.new title: 'pin title', user: User.new
    pin.save!
    
    visit(pin_path(pin))
    refute page.has_content?('Add a comment')
  end
end
