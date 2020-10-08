class AccountController < ApplicationController
  def pins
    if (session[:user_id])
      @user = User.find(session[:user_id])
      @pins = @user.goals
    end
  end
end
