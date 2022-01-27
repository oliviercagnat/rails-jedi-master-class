class Lesson < ApplicationRecord
  belongs_to :user
  def quick_description
    "#{description[0..40]}..."
  end

end
