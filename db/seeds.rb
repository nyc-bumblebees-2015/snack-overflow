User.create(username: "superuser", password: "superuser", email: "superuser@example.com" )
20.times { User.create(username: Faker::Internet.user_name, password: "snacks", email: Faker::Internet.email) }
20.times { Tag.create(name: Faker::Lorem.word) }
75.times { Question.create(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph, user: User.all.sample, tags: Tag.all.shuffle.sample((0..5).to_a.sample) ) }
200.times { Answer.create(content: Faker::Lorem.paragraph, user: User.all.sample, question: Question.all.sample) }
75.times { Comment.create(content: Faker::Lorem.paragraph, user: User.all.sample, commentable: Question.all.sample ) }
75.times { Comment.create(content: Faker::Lorem.paragraph, user: User.all.sample, commentable: Answer.all.sample ) }
5000.times { Vote.create(user: User.all.sample, value: [-1,0,1].sample, votable: Question.all.sample )}
5000.times { Vote.create(user: User.all.sample, value: [-1,0,1].sample, votable: Answer.all.sample )}
10.times do
  question = Question.all.sample
  question.accepted_answer = question.answers.sample
end
