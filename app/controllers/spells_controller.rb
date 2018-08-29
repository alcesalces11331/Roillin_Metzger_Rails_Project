class SpellsController < ApplicationController
  before_action :login_checkpoint, only: [:new, :create, :edit, :update, :destroy]

  def index
    # provide a list of cats to the view for filter control
    @cats = Cat.all
  #  byebug
    if !params[:cat_id].blank?
      @spells = Spell.by_cat(params[:cat_id])
    else
      @spells = Spell.all
    end
  end

  def new
    @spell = Spell.new
  end

  def create
    @spell = Spell.new(spell_params)
    @spell.cat_id = params[:cat_id]
    if @spell.save
      redirect_to spell_path(@spell)
    else
      render :new
    end
  end

  def show
    byebug
    @spell = Spell.find_by(id: params[:id])
    @cat = Cat.find_by(id: @spell.cat_id)

  end

  def edit
    @spell = Spell.find_by(id: params[:id])
  end

  def update
    @spell = Spell.find_by(id: params[:id])
    if @spell.update(spell_params)
      redirect_to spell_path(@spell)
    else
      render :edit
    end
  end

  def destroy
    @spell = Spell.find_by(id: params[:id])
    @spell.destroy
    redirect_to user_path(current_user.id)
  end

  private

  def spell_params
    params.require(:spell).permit(:name, :description, :power_type, :power_level)
  end

end
