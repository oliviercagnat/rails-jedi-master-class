class CreateLessons < ActiveRecord::Migration[6.1]
  def change
    create_table :lessons do |t|
      t.string :skill_name
      t.text :description
      t.integer :price
      t.date :start_at
      t.date :end_at
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
