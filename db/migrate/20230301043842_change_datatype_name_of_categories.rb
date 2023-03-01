class ChangeDatatypeNameOfCategories < ActiveRecord::Migration[7.0]
  def change
    change_column :categories, :name, :string
  end
end
