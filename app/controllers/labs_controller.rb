class LabsController < ApplicationController

  before_action :set_cohort

  def index
  end

  def show
    @lab = Lab.find_by(slug: params[:slug], cohort: @cohort)
  end

  def new
    @lab = Lab.new
  end

  def create
    lab = Lab.new(lab_params)
    lab.cohort = @cohort
    if lab.save
      lab.update(deploy_date: (Adapters::GitHubWrapper.new.get_repo_create_date(lab) || Date.today))
      AddLabWebhookJob.perform_later(lab.id)
      redirect_to cohort_lab_path(@cohort, lab)
    else
      redirect_to new_cohort_lab_path(@cohort), flash[:notice] = lab.errors.messages
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
      params.require(:lab).permit(:name, :repo, :cohort_id)
    end

    def set_cohort
      @cohort = Cohort.find_by(name: params[:cohort_slug])
    end

    def set_lab
    end
end
