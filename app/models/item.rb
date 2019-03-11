class Item < ApplicationRecord
  belongs_to :user
  has_many :deals
  has_many :reviews
end
