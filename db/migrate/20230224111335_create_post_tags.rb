class CreatePostTags < ActiveRecord::Migration[7.0]
  def change
    create_table :post_tags do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
    add_index :post_tags, [:tag_id, :post_id], unique: true
  end
end
