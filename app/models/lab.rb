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

  def files
    filenames = self.pull_requests.map {|pr| pr.pull_request_files}.flatten.pluck(:name).map!(&:downcase).delete_if {|f| f.start_with?("db/")}
    filenames.map {|filename| filename.split("/").last}.uniq
  end

end
