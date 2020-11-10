class Category < ApplicationRecord
  belongs_to :story, optional: true
  mount_uploader :image, ImageUploader
  
end
