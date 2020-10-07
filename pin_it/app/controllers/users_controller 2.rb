class UsersController < ApplicationController
  def log_in
  end

  def show
    @user = User.new
  end

  def new
   @user = User.new
  end
end
