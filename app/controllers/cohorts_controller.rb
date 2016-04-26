class CohortsController < ApplicationController

  def index
  end

  def new
    @cohort = Cohort.new
  end

  def create
    @cohort = Cohort.new(cohort_params)
    if @cohort.save
      @cohort.create_members
      redirect_to @cohort
    else
      redirect_to new_cohort_path
    end
  end

  def show
    @cohort = Cohort.find_by(name: params[:slug])
  end

  def destroy
  end

  private
    def cohort_params
      params.require(:cohort).permit(:name, :roster_csv,)
    end
end
