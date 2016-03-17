class PhotosController < ApplicationController
  before_action :authenticate_user!
  def create
    @place = Place.find(params[:place_id])
    @place.photos.create(photo_params.merge(user:current_user))
    if @place.invalid?
      flash[:error] = "<strong>-Could Not Add Photo-</strong><br />Please include a photo and a caption that is between 3 and 100 characters"
    end
    redirect_to place_path(@place)
  end

  private

  def photo_params
    params.require(:photo).permit(:caption, :picture)
  end

end
