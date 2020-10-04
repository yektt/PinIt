class PinsController < ApplicationController
  
  def index
    if (params[:q].nil? || params[:q].empty?)
      @search_term = "everything"
      @pins = Pin.all
    else
      @search_term = params[:q]
      @pins = Pin.search(@search_term)
    end

    
  end

  def new
  end

  def create
    pin = Pin.new(pins_params)
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
    pin.update(pins_params)
    redirect_to account_pins_path
  end

  private

  def pins_params
    params.permit(:title, :tag, :image_url)
  end
end
