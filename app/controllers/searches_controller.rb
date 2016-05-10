class SearchesController < ApplicationController

  def new
    @search = Search.new(type: params[:type], query: params[:query])
    @search.execute(params[:cohort][:id]) if @search.valid?
    # cohort_id = params[:cohort][:id]
    # if @search.valid?
    #   @search.execute(params[:cohort][:id])
    #   # if @search.type == 'students'
    #   #   @search.results = Student.where('first_name ILIKE ? OR last_name ILIKE ?', "%#{@search.query}%", "%#{@search.query}%")
    #   # else
    #   #   @search.results = Lab.where('name ILIKE ? AND cohort_id = ?', "%#{@search.query}%", cohort_id)
    #   # end
    # end
    render 'new'
  end

end
