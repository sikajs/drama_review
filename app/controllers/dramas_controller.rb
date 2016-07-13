class DramasController < ApplicationController
  before_action :find_drama, only: [:show, :edit, :update, :destroy]

  def index
    @dramas = Drama.all.order("created_at DESC")
  end

  def show
  end

  def new
    @drama = Drama.new
  end

  def create
    @drama = Drama.new(drama_params)

    if @drama.save
      redirect_to @drama, notice: "Drama successfully created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @drama.update(drama_params)
      redirect_to @drama
    else
      render :edit
    end
  end

  def destroy
    @drama.image = nil
    @drama.save
    @drama.destroy
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
