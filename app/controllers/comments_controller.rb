class CommentsController < ApplicationController
	before_action :authenticate_user!
  def create
    @place = Place.find(params[:place_id])
    @comment = @place.comments.create(comment_params.merge(:user => current_user))

    if @comment.valid?
      redirect_to place_path(@place)
    else
      flash.now[:alert] = "Your Comment was not Added"
      redirect_to place_path(@place)
    end

  end

  private

  def comment_params
    params.require(:comment).permit(:message, :rating)
  end
end


