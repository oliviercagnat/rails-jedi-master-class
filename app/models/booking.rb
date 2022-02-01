class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :lesson
  validates_uniqueness_of :user, scope: :lesson
  enum status: { pending: "pending", confirmed: "confirmed", denied: "denied" }, _default: "pending"
end
