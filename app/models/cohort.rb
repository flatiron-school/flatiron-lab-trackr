require 'csv'
class Cohort < ApplicationRecord
  has_many :students
  has_many :labs

  validates :name, uniqueness: true, presence: true, format: {with: /\A\S+\z/, message: "can't contain spaces"}

  has_attached_file :roster_csv, :path => ":rails_root/public/system/rosters/:filename"
  validates_attachment :roster_csv, content_type: { content_type: ["text/csv", "text/comma-separated-values"] }
  validates_attachment_file_name :roster_csv, :matches => [/csv\Z/]

  def to_param
    self.name
  end


  def create_members
    return if !roster_csv.path
    csv_rows = CSV.foreach(roster_csv.path, headers: true)
    csv_rows.each do |student_row|
      student = Student.find_or_create_from_row(student_row.to_h)
      student.update(cohort: self)
    end
  end

end

