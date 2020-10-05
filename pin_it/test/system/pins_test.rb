require "application_system_test_case"

class PinsTest < ApplicationSystemTestCase

  test "create new pin" do
    visit (new_pin_path)
    fill_in('Title', with: 'Finish all mangas')
    fill_in('Tag', with:'manga all mangas read')
    fill_in('Image url', with: 'http://fpoimg.com/255x170')
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
    fill_in('Tag', with:'tags of the pin')
    fill_in('Title', with:'new pin title')
  
    click_on('Update Pin')
    click_on('new pin title')
    
    assert page.has_content?('new pin title'.upcase)
    assert page.has_content?('tags of the pin')
  end

  test 'search' do
    pin_1 = Pin.new
    pin_1.title = 'Do something with clay'
    pin_1.save!
  
    pin_2 = Pin.new
    pin_2.title = 'Finish Witcher III again'
    pin_2.save!
  
    visit(root_path)
    fill_in('q', with:'with')
  
    click_on('Search', match: :first)
    
    assert current_path.include?(pins_path)
    assert page.has_content?('Do something with clay')
    refute page.has_content?('Finish Witcher III again')
  end

  test 'no search results' do
    visit (pins_path)
    assert page.has_content?('No pins found!')
  end

  test 'home_page highlights' do
    7.times do |i|
      pin = Pin.new title: "pin title #{i+1}"
      pin.save!
    end

    visit (root_path)
    assert page.has_content?('pin title 7')
    assert page.has_content?('pin title 6')
    assert page.has_content?('pin title 5')
    assert page.has_content?('pin title 4')
    assert page.has_content?('pin title 3')
    assert page.has_content?('pin title 2')
    refute page.has_content?('pin title 1')    
  end

  test 'search by description and title' do
    pin_1 = Pin.new title: 'Buy a new phone',
                    tag: 'iphone samsung android ios'
    pin_1.save!

    pin_2 = Pin.new title: 'Make camp',
                    tag: 'camp sunset sunrise lake'
    pin_2.save!

    pin_3 = Pin.new title: 'Swim in the lake Leman',
                    tag: 'swim evian lausanne'
    pin_3.save!

    visit(root_path)
    fill_in('q',with: 'lake')
    click_on('Search',match: :first)

    assert page.has_content?('Make camp')
    assert page.has_content?('Swim in the lake Leman')
    refute page.has_content?('Buy a new phoned')
  end

end


