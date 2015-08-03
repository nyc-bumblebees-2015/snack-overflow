FactoryGirl.define do
  factory :tag do
    name { Faker::Lorem.characters(5) }
  end
end
