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

end


