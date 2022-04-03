class Machine < ApplicationRecord
  belongs_to :admin
  belongs_to :site
  has_many :posts ,dependent: :destroy

  validates :machine_name, presence: true
  validates :machine_image, presence: true
  validates :explanation, presence: true
  validates :site_id, presence: true

  enum machine_status: { used_ok: 0, used_ng: 1, used_schedule: 2 }

  has_one_attached :machine_image

  def get_machine_image(width, height)
    unless machine_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      machine_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    machine_image.variant(resize_to_limit: [width, height]).processed
  end
end
