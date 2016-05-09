class Search
  include ActiveModel::Model
  attr_accessor :type, :query, :results
  validates :query, presence: true

  def results_exist?
    results && !results.empty?
  end

end
