class Search
  include ActiveModel::Model
  attr_accessor :type, :query, :results, :cohort_id
  validates :query, presence: true


  def execute
    if type == 'students'
      student_search
    else
      lab_search
    end
  end

  def student_search
    self.results = Student.where('first_name ILIKE ? OR last_name ILIKE ?', "%#{query}%", "%#{query}%")
  end

  def lab_search
    self.results = Lab.where('name ILIKE ? AND cohort_id = ?', "%#{query}%", cohort_id)
  end

  def results_exist?
    results && !results.empty?
  end

  def for_students?
    type == "students"
  end

  def for_labs?
    type == "labs"
  end

end
