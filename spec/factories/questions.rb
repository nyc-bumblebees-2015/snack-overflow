FactoryGirl.define do
  factory :question do
    association :user
    title { Faker::Company.bs }
    content { Faker::Lorem.paragraph }
  end
end
