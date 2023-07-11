class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :image

  has_many :recipes, dependent: :destroy
  has_many :recipe_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :reverse_follows, class_name: "Follow", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :reverse_follows, source: :follow

  has_many :follows, class_name: "Follow", foreign_key: "follow_id", dependent: :destroy
  has_many :followings, through: :follows, source: :followed
  
  has_many :blogs

  def self.guest
    find_or_create_by!(name: 'guestuser' ,email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

 def get_image(width,height)
  unless image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
     image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end

     image.variant(resize_to_limit: [width, height]).processed
 end

  def follow(user)
    follows.create(followed_id: user.id)
  end

  def unfollow(user)
    follows.find_by(followed_id: user.id).destroy
  end

  def following?(user)
    followings.include?(user)
  end

  def self.search_for(content, method)
    if method == 'perfect'
      User.where(name: content)
    elsif method == 'forward'
      User.where('name LIKE ?', content + '%')
    elsif method == 'backward'
      User.where('name LIKE ?', '%' + content)
    else
      User.where('name LIKE ?', '%' + content + '%')
    end
  end


end
