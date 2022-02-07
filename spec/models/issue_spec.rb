require 'rails_helper'

RSpec.describe Issue, type: :model do

  
  context "validations" do
    it "is valid with valid attributes" do
      issue = Issue.new(number: rand(1..2000),issue: "{issue_payload}")
     expect(issue).to be_valid 
    end 

    it "is not valid without a issue number" do
      issue = Issue.new(number: nil)
      expect(issue).to_not be_valid    
    end
    
    it "is not valid without a issue payload" do
      issue = Issue.new(issue: nil)
      expect(issue).to_not be_valid   
    end
  end
end
