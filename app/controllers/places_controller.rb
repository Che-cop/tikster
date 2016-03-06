class PlacesController < ApplicationController

  def index
    @places = Place.order(:id).page(params[:page])
  end

  def new
    @place = Place.new
  end



end
