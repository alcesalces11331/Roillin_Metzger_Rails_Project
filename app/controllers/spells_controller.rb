class SpellsController < ApplicationController
  before_action :login_checkpoint, only: [:new, :create, :update, :destroy]

  def index
    if params[:cat_id]
      @spells = Spell.find(params[:cat_id]).spells
    else
      @spells = Spell.all
    end
  end

  def new
    @spell = Spell.new
  end

  def create
    @spell = Spell.new(spell_params)
    @spell.cat = params[:cat_id]
    if @spell.save
      redirect_to cats_path(@spell)
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

  def spell_params
    params.require(:spell).permit(:name, :description, :power_type, :power_level)
  end

end
