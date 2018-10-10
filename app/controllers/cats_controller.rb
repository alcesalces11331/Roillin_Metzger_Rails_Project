class CatsController < ApplicationController
  before_action :login_checkpoint, only: [:new, :create, :edit, :update, :destroy]

  def index
    if params[:user_id].to_i == current_user.id
      @cats = Cat.by_user(params[:user_id])
    else
      @cats = Cat.all
    end
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
      flash[:message] = "#{@cat.errors.full_messages}"
      render :new
    end
  end

  def show
    if params[:cat_id]
      @cat = Cat.find_by(id: params[:cat_id])
    elsif params[:spell_id]
      @spell = Spell.find_by(id: params[:spell_id])
      @cat = Cat.find_by(id: @spell.cat_id)
    else
      find_cat
    end
  end

  def edit
    find_cat
  end

  def update
    find_cat
    if @cat.update(cat_params)
      redirect_to cat_path(@cat)
    else
      flash[:message] = "#{@cat.errors.full_messages}"
      render :edit
    end
  end

  def destroy
    find_cat
    @cat.destroy
    redirect_to user_path(current_user.id)
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :type_of, :age)
  end

  def find_cat
    @cat = Cat.find_by(id: params[:id])
  end
end
