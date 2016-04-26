class Lab < ApplicationRecord
  belongs_to :cohort

  def to_param
    self.name.downcase.gsub(" ", "-")
  end
end
