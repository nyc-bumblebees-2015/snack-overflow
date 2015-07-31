class User < ActiveRecord::Base
  has_secure_password

  before_save { |user| user.email.downcase! }
  before_save { |user| user.username.downcase!}

  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes

  validates :username, presence: true
  validates_uniqueness_of :username,  case_sensitive: false
  validates :password, presence: true, length: {minimum: 6}, confirmation: true
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

end

