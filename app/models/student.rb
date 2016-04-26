class Student < ApplicationRecord
  belongs_to :cohort
  has_many :pull_requests
  has_many :labs, through: :pull_requests

  def self.find_or_create_from_row(params)
    cols = self.columns.map {|col| col.name}
    params.delete_if {|key| !cols.include?(key)}
    self.find_or_create_by(params)
  end

  def full_name
    "#{self.first_name} #{self.last_name}" 
  end
end
