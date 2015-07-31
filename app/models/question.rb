class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :comments, :as => :commentable
  has_many :votes, :as => :votable
  has_and_belongs_to_many :tags
  belongs_to :accepted_answer, class_name: "Answer"

  validates :title, :content, :user_id, presence: true

  validate :accepted_answer_belongs_to_question

  private
  def accepted_answer_belongs_to_question
    unless !accepted_answer || accepted_answer.question == self
      errors.add(:accepted_answer, "must belong to question")
    end
  end
end
