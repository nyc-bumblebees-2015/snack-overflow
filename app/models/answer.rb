class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :comments, :as => :commentable
  has_many :votes, :as => :votable

  validates :content, :user_id, :question_id, presence: true
end
