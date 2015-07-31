FactoryGirl.define do
  factory :question do
    title { Faker::Company.bs }
    content { Faker::Lorem.paragraph }
  end
end
