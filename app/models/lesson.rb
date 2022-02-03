class Lesson < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :skill_picture
  def quick_description
    "#{description[0..40]}..."
  end
end
