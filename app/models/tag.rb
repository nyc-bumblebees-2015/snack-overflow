class Tag < ActiveRecord::Base
  has_and_belongs_to_many :questions
  validates :name, presence: true, length: { minimum: 3 }

  def self.most_popular_sort
    Tag.all.sort{|a, b| b.questions.count <=> a.questions.count }
  end
  def newest_questions
    self.questions.order(created_at: :desc).limit(30)
  end
end

