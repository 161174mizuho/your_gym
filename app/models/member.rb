class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  has_many :posts,dependent: :destroy
  has_many :comments,dependent: :destroy
  has_many :goods,dependent: :destroy
  has_one_attached :icon

  def get_icon(width, height)
    unless icon.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      icon.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    icon.variant(resize_to_limit: [width, height]).processed
  end
end
