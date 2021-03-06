class User < ActiveRecord::Base
  has_secure_password

  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :password

  has_many :favorites
  has_many :posts, through: :favorites
  has_many :posts
end
