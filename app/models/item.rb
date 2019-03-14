class Item < ApplicationRecord
  belongs_to :user
  has_many :deals
  has_many :reviews
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  mount_uploader :photo, PhotoUploader
end
