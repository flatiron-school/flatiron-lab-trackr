class SearchesController < ApplicationController

  def new
    @search = Search.new(type: params[:type], query: params[:query], cohort_id: params[:cohort][:id])
    @search.execute if @search.valid?
    render 'new'
  end

end
