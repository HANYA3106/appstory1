class Story < ApplicationRecord
  belongs_to :user
  has_one :category
  has_one :subject
  has_one :purpose
  has_one :tale
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  with_options presence: true do
    validates :category_id 
    validates :subject_id
    validates :purpose_id
    validates :tale_id
    validates :text
  end

end
