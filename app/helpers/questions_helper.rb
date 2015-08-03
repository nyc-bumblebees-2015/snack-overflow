module QuestionsHelper

  def sort_answer_by_most_votes(question)
    question.answers.sort { |a, b| b.votes_total <=> a.votes_total }
  end
end
