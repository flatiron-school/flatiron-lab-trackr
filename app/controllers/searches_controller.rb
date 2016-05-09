class SearchesController < ApplicationController

  def new
    @search = Search.new(type: params[:type], query: params[:query])
    cohort_id = params[:cohort][:id]
    if @search.valid?
      if @search.type == 'students'
        @search.results = Student.where('first_name ILIKE ? OR last_name ILIKE ?', "%#{@search.query}%", "%#{@search.query}%")
      else
        @search.results = Lab.where('name ILIKE ? AND cohort_id = ?', "%#{@search.query}%", cohort_id)
      end
    end
    render 'new'
  end

end
