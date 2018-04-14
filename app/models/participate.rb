class Participate < ApplicationRecord
  include AASM

  aasm :column => 'state' do
    state :pending, initial: true
    state :paid

    event :pay do
      transitions from: :pending, to: :paid
    end
  end
  belongs_to :user
  belongs_to :post, counter_cache: true
end
