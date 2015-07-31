FactoryGirl.define do
  factory :comment do
    association :user
    content { Faker::Lorem.paragraph }

    factory :question_comment do
      association :commentable, factory: :question
    end

    factory :answer_comment do
      association :commentable, factory: :answer
    end
  end
end
