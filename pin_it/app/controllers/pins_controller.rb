class PinsController < ApplicationController
  def edit
  end

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
    redirect_to pins_index_path
  end

  def show
  end
end
