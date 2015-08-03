FactoryGirl.define do
  factory :answer do
    association :user
    association :question
    content { Faker::Lorem.paragraph }

    factory :invalid_answer do 
      association :user
      association :question
      content { nil }
    end
  end
end
