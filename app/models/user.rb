class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :rooms

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  mount_uploader :user_image, UserImageUploader

  
  validates :name, presence: true
  validates :user_image, presence: true, on: :update
  validates :email, uniqueness: true, presence: true
end
