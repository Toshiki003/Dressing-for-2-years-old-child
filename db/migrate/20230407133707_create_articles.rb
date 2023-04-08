class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.string :content, null: false
      t.string :date

      t.timestamps
    end
  end
end
