require "application_system_test_case"

class ShowPinsTest < ApplicationSystemTestCase
  test 'show display title' do
    pin = Pin.new title: 'Adopt a dog',
                    tag: 'adoptation saves lives',
                    user: User.new
    pin.save!

    visit(pin_path(pin))
    assert page.has_content?('Adopt a dog'.upcase)
    assert page.has_content?('adoptation saves lives')
    assert page.has_content?(pin.created_at.strftime("%d %b '%y"))

    click_on('Edit')
  
    assert_equal current_path, edit_pin_path(pin)
  end
end
