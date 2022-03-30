class Post < ApplicationRecord
  
  belongs_to :member
  belongs_to :admin
  has_one_attached :post_image
end
