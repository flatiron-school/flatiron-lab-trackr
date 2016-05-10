class Search
  include ActiveModel::Model
  attr_accessor :type, :query, :results
  validates :query, presence: true

  def results_exist?
    results && !results.empty?
  end

  def execute(cohort_id)
    if self.type == 'students'
      student_search
    else
      lab_search(cohort_id)
    end
  end

  def student_search
    self.results = Student.where('first_name ILIKE ? OR last_name ILIKE ?', "%#{self.query}%", "%#{self.query}%")
  end

  def lab_search(cohort_id)
    self.results = Lab.where('name ILIKE ? AND cohort_id = ?', "%#{self.query}%", cohort_id)
  end

  def for_students?
    self.type == "students"
  end

  def for_labs?
    self.type == "labs"
  end


end
