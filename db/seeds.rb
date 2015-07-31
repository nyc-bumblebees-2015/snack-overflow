questioner = User.create(username: 'questioner', password: 'password1', email: 'questioner@hotmail.com')
answerer = User.create(username: 'answerer', password: 'password2', email: 'answerer@hotmail.com')
commenter = User.create(username: 'commenter', password: 'password3', email: 'commenter@hotmail.com')

question_1 = Question.new(title: 'question 1', content: 'what snack is the best?')
question_2 = Question.new(title: 'question 2', content: 'what snack is the worst?')

answer_1 = Answer.new(content: 'cookies!', question_id: 1)
answer_2 = Answer.new(content: 'liquorice!', question_id: 2)
answer_3 = Answer.new(content: 'dogs', question_id: 1)

comment_1 = Comment.new(content: 'trololol', user_id: 3)
comment_2 = Comment.new(content: 'yum', user_id: 3)
comment_3 = Comment.new(content: 'what kind of question is that?', user_id: 3)

tag_1 = Tag.new(name: 'nsfw')
tag_2 = Tag.new(name: 'gross')

vote_1 = Vote.new(user_id: 1, value: -1)
vote_2 = Vote.new(user_id: 1, value: 1)
vote_3 = Vote.new(user_id: 2, value: -1)
vote_4 = Vote.new(user_id: 2, value: 1)
vote_5 = Vote.new(user_id: 3, value: -1)
vote_6 = Vote.new(user_id: 3, value: 1)

answer_3.votes << [vote_1, vote_3, vote_5]
answer_1.votes << [vote_2, vote_4, vote_6]
question_1.votes << [vote_2, vote_4, vote_6]
question_2.tags << [tag_1, tag_2]
question_2.comments << comment_3
answer_3.comments << [comment_1, comment_2]
answerer.answers << [answer_1, answer_2, answer_3]
questioner.questions << [question_1, question_2]
