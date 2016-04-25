class PullRequest < ApplicationRecord
  belongs_to :lab
  belongs_to :student
  has_many :pull_request_files
end
