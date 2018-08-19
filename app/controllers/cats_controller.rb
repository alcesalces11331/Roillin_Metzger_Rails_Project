class CatsController < ApplicationController
  before_action :login_checkpoint, only: [:index, :new, :create, :update, :destroy]

  def index
    @cats = Cat.all
  end

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)
    @cat.user = current_user
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
    @cat = Cat.find_by(id: params[:id])
  end

  def update
    @cat = Cat.find_by(id: params[:id])
    if @cat.update(cat_params)
      redirect_to cat_path(@cat)
    else
      render :edit
    end
  end

  def destroy
    @cat = Cat.find_by(id: params[:id])
    @cat.destroy
    redirect_to user_path(current_user.id)
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :type_of, :age)
  end
end
