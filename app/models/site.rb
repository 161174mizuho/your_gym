class Site < ApplicationRecord
  belongs_to :admin
  has_many :machine,dependent: :destroy
  
  validates :site_name, presence: true
end
