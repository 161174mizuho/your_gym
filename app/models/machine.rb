class Machine < ApplicationRecord
  has_one_attached :machine_image
  belongs_to :admin
  belongs_to :site
  
  validates :machine_name, presence: true
  validates :machine_image, presence: true
  validates :explanation, presence: true
  validates :site_id, presence: true
  
  enum machine_status: { used_ok: 0, used_ng: 1, used_schedule: 2 }
end
