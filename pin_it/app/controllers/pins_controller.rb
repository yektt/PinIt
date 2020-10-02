class PinsController < ApplicationController
  def edit
  end

  def index
    if (params[:q].empty?)
      @search_term = "everything"
    else
      @search_term = params[:q]
    end
  end

  def new
  end

  def show
  end
end
