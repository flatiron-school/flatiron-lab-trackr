class PullRequestFile < ApplicationRecord
  belongs_to :pull_request
  delegate :student, to: :pull_request
end
