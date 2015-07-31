questioner = User.create!(username: 'questioner', password: 'password1', email: 'questioner@hotmail.com')
answerer = User.create!(username: 'answerer', password: 'password2', email: 'answerer@hotmail.com')
commenter = User.create!(username: 'commenter', password: 'password3', email: 'commenter@hotmail.com')

question_1 = Question.create!(title: 'question 1', content: 'what snack is the best?', user: questioner, accepted_answer_id: 1)
question_2 = Question.create!(title: 'question 2', content: 'what snack is the worst?', user: questioner, accepted_answer_id: 3)

answer_1 = Answer.create!(content: 'cookies!', question: question_1, user: answerer)
answer_2 = Answer.create!(content: 'liquorice!', question: question_2, user: answerer)
answer_3 = Answer.create!(content: 'dogs', question: question_1, user: answerer)

comment_1 = Comment.create!(content: 'trololol', user: commenter, commentable: question_1)
comment_2 = Comment.create!(content: 'yum', user: commenter, commentable: answer_2)
comment_3 = Comment.create!(content: 'what kind of question is that?', user: commenter, commentable: answer_2)

question_2.tags.create!(name: 'nsfw')
question_2.tags.create!(name: 'gross')

vote_1 = Vote.create!(user: questioner, value: -1, votable: question_2)
vote_2 = Vote.create!(user: questioner, value: 1, votable: answer_2)
vote_3 = Vote.create!(user: answerer, value: -1, votable: question_2)
vote_4 = Vote.create!(user: answerer, value: 1, votable: answer_2)
vote_5 = Vote.create!(user: commenter, value: -1, votable: question_2)
vote_6 = Vote.create!(user: commenter, value: 1, votable: answer_2)