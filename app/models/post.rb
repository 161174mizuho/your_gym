class Post < ApplicationRecord

  belongs_to :member
  belongs_to :admin
  belongs_to :machine
  has_many :comments ,dependent: :destroy
  has_many :goods ,dependent: :destroy
  has_one_attached :post_image

  validates :post_image, presence: true
  validates :sentence, presence: true

  def get_post_image(width, height)
    unless post_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      post_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    post_image.variant(resize_to_limit: [width, height]).processed
  end
  
  def good_by?(user)
    goods.exists?(member_id: member.id)
  end
end
