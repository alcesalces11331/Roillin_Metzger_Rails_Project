class SchoolsController < ApplicationController
  include SchoolsHelper

  def show
    @school = School.find_by(name: "Howgarts")
    @cat = Cat.find_by(id: params[:id])
    if @cat.enrolled == false
      @cat = enroll_cat(@cat)
      @cat = Cat.find_by(id: params[:id])
    end
  end

end
