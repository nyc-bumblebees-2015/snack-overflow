FactoryGirl.define do
  factory :comment do
    association :user
    content { Faker::Lorem.paragraph }

    factory :question_comment do
      association :commentable, factory: :question

      factory :invalid_question_comment do
        content nil
      end
    end

    factory :answer_comment do
      association :commentable, factory: :answer

      factory :invalid_answer_comment do
        content nil
      end
    end

  end
end
