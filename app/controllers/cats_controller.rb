class CatsController < ApplicationController

  def new
    @cat = Cat.new
  end

  def show
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
