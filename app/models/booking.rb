class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :lesson
  validates_uniqueness_of :user, scope: :lesson
end
