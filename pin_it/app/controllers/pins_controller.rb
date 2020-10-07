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
    @pin = Pin.new
  end

  def create
    user = User.find(session[:user_id])
    @pin = Pin.new(pins_resource_params)
    @pin.user = user
    if (@pin.save)
      redirect_to pins_path
    else
      render 'new'
    end
  end

  def show
    id = params[:id]
    @pin = Pin.find(id)
    @comment = Comment.new

    @display_add_comment = session[:user_id].present?
  end

  def edit
    id = params[:id]
    @pin = Pin.find(id)
  end

  def update
    @pin = Pin.find(params[:id])
    if(@pin.update(pins_resource_params))
      redirect_to account_pins_path
    else
      render 'edit'
    end
  end

  private

  def pins_resource_params
    params.require(:pin).permit(:title, :tag, :image_url)
  end
end
