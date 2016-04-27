class LabsController < ApplicationController

  def index
  end

  def show
    @lab = Lab.find_by(slug: params[:slug])
  end

  def new
    @lab = Lab.new
    @cohort = Cohort.find_by(name: params[:cohort_slug])
  end

  def create
    binding.pry
    lab = Lab.new(lab_params)
    if lab.save
      Adapters::GitHubWrapper.new.get_repo_create_date(lab.url)
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
