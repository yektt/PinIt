require "application_system_test_case"

class PinCommentsTest < ApplicationSystemTestCase
  
  test 'adding a comment to an pin' do
    pin = Pin.new title: 'title'
    pin.save

    visit (pin_path(pin)) 
    fill_in('Add a comment', with: 'comment')
    click_on('Post', match: :first)

    assert_equal pin_path(pin), page.current_path
    assert page.has_content? ('comment')
  end

end
