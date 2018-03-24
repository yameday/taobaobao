class Participate < ApplicationRecord
  belongs_to :user
  belongs_to :post
  # validates :participate_id, uniqueness: { scope: :user_id }
end
