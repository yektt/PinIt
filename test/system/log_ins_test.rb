require "application_system_test_case"

class LogInsTest < ApplicationSystemTestCase
  test 'sign up creates User' do 
    visit(new_user_path)
    fill_in('Email', with:'new@mail')
    click_on('Log in', match: :first)
    sleep(5.second)

    assert_equal 1, User.all.length 
    assert_equal User.first.email, 'new@mail'
  end
  
  test 'log in does not create a User' do 
    user = User.new email: 'created@mail'
    user.save!

    visit(new_user_path)
    fill_in('Email', with: user.email)
    click_on('Log in', match: :first)

    assert_equal 1, User.all.length
  end
end
