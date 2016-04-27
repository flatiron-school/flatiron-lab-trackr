class Lab < ApplicationRecord
  belongs_to :cohort
  has_many :pull_requests
  validates :repo, presence: true, uniqueness: true

  before_create :slugify

  def to_param
    self.slug
  end

  def slugify
    self.slug = self.name.strip.downcase.gsub(" ", "-")
  end

end
