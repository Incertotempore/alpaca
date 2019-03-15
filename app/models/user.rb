class User < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :items, dependent: :destroy
  has_many :deals, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
