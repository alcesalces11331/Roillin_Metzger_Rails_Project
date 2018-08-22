class SchoolsController < ApplicationController

  def show
    @school = School.find_by(id: params[:id])
  end

end
