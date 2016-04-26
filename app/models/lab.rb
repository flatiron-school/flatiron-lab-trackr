class Lab < ApplicationRecord
  belongs_to :cohort
  validates :url, presence: true

  before_create :slugify

  def to_param
    self.slug
  end

  def slugify
    self.slug = self.name.strip.downcase.gsub(" ", "-")
  end
end
