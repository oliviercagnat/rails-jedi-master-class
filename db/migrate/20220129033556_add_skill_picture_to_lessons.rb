class AddSkillPictureToLessons < ActiveRecord::Migration[6.1]
  def change
    add_column :lessons, :skill_picture, :text
  end
end
