class Student < ApplicationRecord
  belongs_to :cohort
  has_many :pull_requests
  has_many :labs, through: :pull_requests

  before_create :slugify

  def to_param
    self.slug
  end

  def slugify
    self.slug = self.full_name.strip.downcase.gsub(" ", "-")
  end

  def self.find_or_create_from_row(params)
    cols = self.columns.map {|col| col.name}
    params.delete_if {|key| !cols.include?(key)}
    self.find_or_create_by(params)
  end

  def full_name
    "#{self.first_name} #{self.last_name}" 
  end
end
