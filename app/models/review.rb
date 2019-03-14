class Review < ApplicationRecord
  belongs_to :item


  def creator
    User.find(self.user_id).first_name
  rescue
    "no user assigned"
  end
end
