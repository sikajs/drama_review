class CommentsController < ApplicationController
  before_action :set_drama


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

  def destroy
  end

  private
    def set_drama
      @drama = Drama.find(params[:drama_id])
    end

    def set_comment
    end

    def comment_params
      params.require(:comment).permit(:content, :rating)
    end
end
