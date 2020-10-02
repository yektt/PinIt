class AccountController < ApplicationController
  def pins
    @pins = Pin.all
  end
end
