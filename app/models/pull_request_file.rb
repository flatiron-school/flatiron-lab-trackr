class PullRequestFile < ApplicationRecord
  belongs_to :pull_request
  delegate :student, to: :pull_request

  def filename_without_path
    self.name.split("/").last
  end
end
