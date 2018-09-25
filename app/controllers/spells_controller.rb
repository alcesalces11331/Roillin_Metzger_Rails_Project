class SpellsController < ApplicationController
  before_action :login_checkpoint, only: [:new, :create, :edit, :update, :destroy, :lists, :show_by]
  include SpellsHelper

  def index
    # provide a list of cats to the view for filter control
    @power_types = power_types
    @cats = Cat.all
    if !params[:cat_id].blank?
      @cat = Cat.find_by(id: params[:cat_id])
      @spells = Spell.by_cat(@cat)
    else
      @spells = Spell.all
    end

    if params[:power_type]
      @spells = Spell.by_type(params[:power_type])
    else
      @spells = Spell.all
    end
  end

  def new
    @spell = Spell.new
    @power_types = power_types
  end

  def create
    @power_types = power_types
    @spell = Spell.new(spell_params)
    @spell.cat_id = params[:cat_id]
    if @spell.save
      redirect_to spell_path(@spell)
    else
      flash[:message] = "#{@spell.errors.full_messages}"
      render :new
    end
  end

  def show
  #  byebug
    if params[:id] != 'sort'
      @spell = Spell.find_by(id: params[:id])
      @cat = Cat.find_by(id: @spell.cat_id)
    else params[:id] == 'sort'
      @spells = Spell.by_type(params[:power_type])
    end
  end

  def edit
    @power_types = power_types
    @spell = Spell.find_by(id: params[:id])
  end

  def update
    @power_types = power_types
    @spell = Spell.find_by(id: params[:id])
    if @spell.update(spell_params)
      redirect_to spell_path(@spell)
    else
      flash[:message] = "#{@spell.errors.full_messages}"
      render :edit
    end
  end

  def destroy
    @spell = Spell.find_by(id: params[:id])
    @spell.destroy
    redirect_to user_path(current_user.id)
  end

  def show_by
    byebug
    @spells = Spell.by_type(params[:power_type]) if params[:power_type]
    @spells = Spell.by_power_level(params[:power_level]) if params[:power_level]
  end

  private

  def spell_params
    params.require(:spell).permit(:name, :description, { power_type: [] }, :power_level)
  end

end
