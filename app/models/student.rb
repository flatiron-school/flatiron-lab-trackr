class Student < ApplicationRecord
  has_many :pull_requests
  has_many :labs, through: :pull_requests
end
