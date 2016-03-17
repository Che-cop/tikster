class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @place = Place.find(params[:place_id])
    @place.comments.create(comment_params.merge(user:current_user))
    if @place.invalid?
      flash[:error] = "<strong>-Could Not Add Comment-</strong><br />Please include a Rating and a comment that is between 3 and 100 characters"
    end
    redirect_to place_path(@place)
  end

  private

  def comment_params
    params.require(:comment).permit(:message, :rating)
  end

end
