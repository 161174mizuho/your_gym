class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :gym_name, presence: true
  validates :gym_image, presence: true

  has_many :sites,dependent: :destroy
  has_many :machines,dependent: :destroy

  has_one_attached :gym_image

  def get_gym_image(width, height)
  unless gym_image.attached?
    file_path = Rails.root.join('app/assets/images/no.jpg')
    gym_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
    gym_image.variant(resize_to_limit: [width, height]).processed
end

end
