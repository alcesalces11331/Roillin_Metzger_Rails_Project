class SpellsController < ApplicationController
  before_action :login_checkpoint, only: [:new, :create, :update, :destroy]

  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def spell_params
    params.require(:spell).permit(:name, :description, :power_type, :power_level)
  end

end
