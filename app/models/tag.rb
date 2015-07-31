class Tag < ActiveRecord::Base
  has_many :questions, through: :question_tags
end

