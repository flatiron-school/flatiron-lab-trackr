class PullRequestFile < ApplicationRecord
  belongs_to :pull_request
  delegate :student, to: :pull_request

  def filename_without_path
    self.name.split("/").last
  end

  def filepath
    self.name.split("/")[0..-2].join("/")
  end
end
