require 'rails_helper'

RSpec.describe Event, type: :model do
  context "validations" do
    let(:issue) { FactoryBot.create(:issue) }

    # it "belongs to Issue" do
    #   is_expected.to belong_to(:issue)
    # end

    it "is valid with valid attributes" do
      event = Event.new(action: "created", payload: "{payload}", issue: issue)
     expect(event).to be_valid 
    end 

    it "is not valid without a action" do
      event = Event.new(action: nil, issue: issue)
      expect(event).to_not be_valid    
    end
    
    it "is not valid without a payload" do
      event = Event.new(payload: nil, issue: issue)
      expect(event).to_not be_valid   
    end
  end
end
