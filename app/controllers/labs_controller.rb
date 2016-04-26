class LabsController < ApplicationController

  def index
  end

  def show
    @lab = Lab.find_by(slug: params[:slug])
  end

  def new
    @lab = Lab.new
  end

  def create
    lab = Lab.new(lab_params)
    if lab.save
      Adapters::GitHubWrapper
      redirect_to lab
    else
      redirect_to new_lab_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def lab_params
      params.require(:lab).permit(:name, :url, :cohort_id)
    end
end
