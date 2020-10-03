class PinsController < ApplicationController
  
  def index
    if (params[:q].nil? || params[:q].empty?)
      @search_term = "everything"
    else
      @search_term = params[:q]
    end

    @pins = Pin.all
  end

  def new
  end

  def create
    pin = Pin.new
    pin.title = params[:inputTitle]
    pin.tag = params[:inputTag]
    pin.image_url = params[:inputImageUrl]
    pin.save!
    redirect_to pins_index_path
  end

  def show
    id = params[:id]
    @pin = Pin.find(id)
  end

  def edit
    id = params[:id]
    @pin = Pin.find(id)
  end

  def update
    pin = Pin.find(params[:id])
    pin.title = params[:inputTitle]
    pin.tag = params[:inputTag]
    pin.image_url = params[:inputImageUrl]
    pin.save!
    redirect_to account_pins_path
  end
end
