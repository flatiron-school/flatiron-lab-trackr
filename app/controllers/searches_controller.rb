class SearchesController < ApplicationController

  def new
    unless params[:query].empty? || params[:query] == " "
      if params[:type] == 'students'
        @students = Student.where('first_name ILIKE ? OR last_name ILIKE ?', "%#{params[:query]}%", "%#{params[:query]}%")
      else
        @labs = Lab.where('name ILIKE ? AND cohort_id = ?', "%#{params[:query]}%", params[:cohort][:id])
      end
    end
    render 'new'
  end

end
