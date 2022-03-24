class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :gym_image
  validates :gym_name, presence: true
  validates :gym_image, presence: true
  
  has_many :sites,dependent: :destroy
  # has_many :sites,dependent: :destroy
end
