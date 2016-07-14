class DramasController < ApplicationController
  before_action :find_drama, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @dramas = Drama.all.order("created_at DESC")
  end

  def show
    @comments = Comment.where(drama: @drama).order("created_at DESC")

    if @comments.blank?
      @avg_rating = 0
    else
      @avg_rating = @comments.average(:rating)
    end
  end

  def new
    @drama = current_user.dramas.build
  end

  def create
    @drama = current_user.dramas.build(drama_params)

    if @drama.save
      flash[:success] = "Drama successfully created"
      redirect_to @drama
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @drama.update(drama_params)
      flash[:success] = "Drama successfully updated"
      redirect_to @drama
    else
      render :edit
    end
  end

  def destroy
    @drama.image = nil
    @drama.save
    @drama.destroy
    flash[:success] = "Drama successfully deleted"
    redirect_to root_path
  end

  private
    def find_drama
      @drama = Drama.find(params[:id])
    end

    def drama_params
      params.require(:drama).permit(:title, :description, :num_of_chapter, :actors, :rating, :image)
    end
end
