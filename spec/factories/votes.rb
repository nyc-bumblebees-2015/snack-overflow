FactoryGirl.define do
  factory :vote do
    association :user

    factory :question_upvote do
      value 1
      association :votable, :factory => :question
    end

    factory :question_downvote do
      value -1
      association :votable, :factory => :question
    end

    factory :answer_upvote do
      value 1
      association :votable, :factory => :answer
    end

    factory :answer_downvote do
      value -1
      association :votable, :factory => :answer
    end
  end
end
