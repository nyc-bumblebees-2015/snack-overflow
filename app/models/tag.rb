class Tag < ActiveRecord::Base
<<<<<<< HEAD
  has_and_belongs_to_many :questions
=======
  has_many :questions, through: :question_tags

  validates :name, presence: true, length: { minimum: 3 }
>>>>>>> 73f05c8ad63866ad43c77583b3deb76ba6cea8d8
end

