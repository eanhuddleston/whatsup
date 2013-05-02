class CommentsController < ApplicationController
  def create
    puts "******************************"
    puts params

    @comment = Comment.new(params[:comment])

    if current_user.nil?
      flash[:notice] = "You need to be logged in to comment"
      redirect_to event_url(@comment.event_id)
      return
    else
      @comment.user_id = current_user.id
    end

    if @comment.save!
      redirect_to event_url(@comment.event_id)
    else
      redirect_to event_url(@comment.event_id)
    end
  end
end