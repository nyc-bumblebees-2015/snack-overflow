FactoryGirl.define do
  factory :comment do
    content { Faker::Lorem.paragraph }

    factory :question_comment do
      commentable_type 'question'
    end

    factory :answer_comment do
      commentable_type 'answer'
    end
  end
end