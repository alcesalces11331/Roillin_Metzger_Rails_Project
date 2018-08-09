class CatsController < ApplicationController
  before_action :login_checkpoint, only: [:new, :create]

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to cat_path(@cat)
    else
      render :new
    end
  end

  def show
    @cat = Cat.find_by(id: params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :type, :age)
  end
end
