FactoryGirl.define do
  factory :tag do
    name { Faker::Company.buzzword }
  end
end
