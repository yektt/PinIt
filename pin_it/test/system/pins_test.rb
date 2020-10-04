require "application_system_test_case"

class PinsTest < ApplicationSystemTestCase

  test "create new pin" do
    visit (new_pin_path)
    fill_in('title', with: 'Finish all mangas')
    fill_in('tag', with:'manga all mangas read')
    fill_in('image_url', with: 'http://fpoimg.com/255x170')
    click_on ('Create Pin')
    assert page.has_content?('Finish all mangas')
  end

  test 'index loads pins' do
    pin_1 = Pin.new
    pin_1.title = 'Learn how to draw anime characters'
    pin_1.save!
  
    pin_2 = Pin.new
    pin_2.title = 'Start writing a little anime'
    pin_2.save!
  
    visit (pins_path)
    assert page.has_content?('Learn how to draw anime characters')
    assert page.has_content?('Start writing a little anime')
  end

  test 'editing a pin' do
    pin = Pin.new title: 'pin title'
    pin.save!
    visit(edit_pin_path(pin))
    fill_in('tag', with:'tags of the pin')
    fill_in('title', with:'new pin title')
  
    click_on('Update Pin')
    click_on('new pin title')
    
    assert page.has_content?('new pin title')
    assert page.has_content?('tags of the pin')
  end

end
