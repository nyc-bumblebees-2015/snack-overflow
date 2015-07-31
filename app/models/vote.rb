class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :votable, :polymorphic => true

  validates :votable_id, :votable_type, :user_id, :value, presence: true
  validate :value, numericality: { only_integer: true,
                                   greater_than_or_equal_to: -1,
                                   less_than_or_equal_to: 1
                                 }

end
