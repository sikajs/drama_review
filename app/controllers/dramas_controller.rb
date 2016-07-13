class DramasController < ApplicationController
  before_action :find_drama, only: [:show, :edit, :update, :destroy]

  def index
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
  end

  def destroy
  end

  private
    def find_drama
      @drama = Drama.find(params[:id])
    end

    def drama_params
      params.require(:drama).permit(:title, :description, :num_of_chapter, :actors, :rating)
    end
end
