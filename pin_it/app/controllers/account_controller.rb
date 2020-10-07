class AccountController < ApplicationController
  def pins
    @user = User.find(session[:user_id])
    @pins = @user.goals
  end
end
