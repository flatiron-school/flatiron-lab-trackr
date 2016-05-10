require 'rails_helper'

RSpec.describe Search, type: :model do
  describe "#initialize" do 
    it "should initialize with a hash of attributes" do 
      search = Search.new(type: "students", query: "Antoin Campbell", cohort_id: "1")
      expect(search).to be_valid
    end
  end

  describe "#execute" do 
    before(:all) do
      test_seed 
    end
    
    it "returns the matching students when called on a search instance with type 'students'" do 
      search = Search.new(type: "students", query: "Steven", cohort_id: "1")
      search.execute
      expect(search.results).to include(Student.find_by_first_name("Steven"))
    end

    it "returns the matching labs when called on a search instance with type 'labs'" do 
      search = Search.new(type: "labs", query: "strong", cohort_id: "1")
      search.execute
      expect(search.results).to include(Lab.find_by(name: "Strong Params Basics"))
    end
  end
end