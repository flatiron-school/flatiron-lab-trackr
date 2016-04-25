class CohortsController < ApplicationController

  def index
  end

  def new
  end

  def create
  end

  def show
  end

  def destroy
  end

  private
    def cohort_params
      params.require(:cohort).permit(:name)
    end
end
