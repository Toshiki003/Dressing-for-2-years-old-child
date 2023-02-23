class AddColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :avator, :integer
  end
end
