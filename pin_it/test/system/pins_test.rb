require "application_system_test_case"

class PinsTest < ApplicationSystemTestCase
  
  test 'no search results' do
    visit (pins_path)
    assert page.has_content?('No pins found!')
  end

end
