class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :recipes, dependent: :destroy
  has_many :recipe_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  has_many :reverse_follows, class_name: "Follow", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :reverse_follows, source: :follower 
  
  has_many :follows, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy
  has_many :followings, through: :foll, source: :followed
end
