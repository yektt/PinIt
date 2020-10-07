class HomeController < ApplicationController
  def index
    @pins = Pin.most_recent()
    if (session[:user_id] == nil)
      @disabled_account_path = false
    end
  end
  
  def about 
    if (session[:user_id] == nil)
      @disabled_account_path = false
    end
  end
end
