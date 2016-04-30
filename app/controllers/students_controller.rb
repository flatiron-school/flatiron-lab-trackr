class StudentsController < ApplicationController

  def show
    @student = Student.find_by(slug: params[:slug])
  end
end
