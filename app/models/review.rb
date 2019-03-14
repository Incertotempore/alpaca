class Review < ApplicationRecord
  belongs_to :item

  validates :item_id, presence: true
  validates :user_id, presence: true
  validates :comment, presence: true
  validates :rating, numericality: { only_integer: true }, presence: true, inclusion: { in: [0, 1, 2, 3, 4, 5] }
  def creator
    User.find(self.user_id).first_name
  rescue
    "no user assigned"
  end
end
