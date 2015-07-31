class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :comments, :as => :commentable
  has_many :votes, :as => :votable
<<<<<<< HEAD
  has_and_belongs_to_many :tags
=======
  has_many :tags, through: :question_tags

  validates :title, :content, :user_id, presence: true
>>>>>>> 73f05c8ad63866ad43c77583b3deb76ba6cea8d8
end
