class Lesson < ApplicationRecord
  belongs_to :user
  # comment-out when using seed
  # has_one_attached :skill_picture
end
