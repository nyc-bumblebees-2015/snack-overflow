class Tag < ActiveRecord::Base
  has_many :questions, through: :question_tags

  validates :name, presence: true, length: { minimum: 3 }
end

