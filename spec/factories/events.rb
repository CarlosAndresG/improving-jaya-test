FactoryBot.define do
  factory :event do
    association :issue    
    action = "Created"
    payload = Faker::Movie.quote
  end


end
