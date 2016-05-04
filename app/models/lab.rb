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
    filenames = self.pull_requests.map {|pr| pr.pull_request_files}.flatten.pluck(:name).map!(&:downcase).delete_if {|f| f.start_with?("db/") || !f.scan(/_spec/).empty?}
    filenames.map {|filename| filename.split("/").last}.uniq
  end

  def directories
    filenames = self.pull_requests.map {|pr| pr.pull_request_files}.flatten.pluck(:name).map!(&:downcase).delete_if {|f| f.start_with?("spec/")}
    filenames.map {|file| file.split("/")[0..-2].join("/")}.uniq
  end

  def pull_requests?
    !self.pull_requests.empty?
  end
end
