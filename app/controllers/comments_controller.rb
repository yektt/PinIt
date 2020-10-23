class CommentsController < ApplicationController
  def create
    logger.info('id')
    logger.info(session[:user_id])
    user_id = session[:user_id]
    user = User.find(user_id)

    comment = Comment.new (comment_params)
    pin = Pin.find(params[:pin_id])
    comment.pin = pin
    comment.user = user
    comment.save!

    redirect_to pin_path(pin)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
