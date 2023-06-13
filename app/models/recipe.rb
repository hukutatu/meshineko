class Recipe < ApplicationRecord
  has_one_attached :image
  
  belongs_to :user
  has_many :recipe_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  
  
 def favorited_by?(user)
  favorites.where(user_id: user.id).exists?
 end
 
end

