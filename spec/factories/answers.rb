FactoryGirl.define do
  factory :answer do
    association :user
    association :question
    content { Faker::Lorem.paragraph }
  end
end
