class SchoolsController < ApplicationController

  def show
    @school = School.find_by(name: "Howgarts")
    @cat = Cat.find_by(id: params[:id])
    if @cat.enrolled?
      enroll_cat(@cat)
    end
  end

end
