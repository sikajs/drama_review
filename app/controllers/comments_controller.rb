class CommentsController < ApplicationController
  before_action :set_drama
  before_action :authenticate_user!

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.drama = @drama
    @comment.user = current_user

    if @comment.save
      redirect_to @drama
    else
      render :new
    end
  end

  private
    def set_drama
      @drama = Drama.find(params[:drama_id])
    end

    def comment_params
      params.require(:comment).permit(:content, :rating)
    end
end
