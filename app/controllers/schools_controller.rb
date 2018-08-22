class SchoolsController < ApplicationController

  def show
    @school = School.find_by(name: "Howgarts")
  end

end
