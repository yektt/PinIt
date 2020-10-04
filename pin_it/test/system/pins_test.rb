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

end
