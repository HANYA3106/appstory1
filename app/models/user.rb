class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
        
  has_many :stories
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post

  with_options presence: true do
    validates :nickname
    validates :email
    validates :password
  end

  def already_liked?(story)
    self.likes.exists?(story_id: story.id)
  end

end