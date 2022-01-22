class AddSideToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :side, :string
  end
end
