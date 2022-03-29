class Post < ApplicationRecord
  
  belongs_to :member
  has_one_attached :post_image
end
