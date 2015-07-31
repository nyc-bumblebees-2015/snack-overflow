class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :votable, :polymorphic => true

  validates :votable_id, :votable_type, :user_id, :value, presence: true
  validate :valid_vote_value

  private
  def valid_vote_value
    if value < -1 || value > 1
      errors.add(value: "cannot be less than -1 or greater than 1")
    end
  end
end
