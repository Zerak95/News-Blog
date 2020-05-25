class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.references :topic, foreign_key: true
      t.integer :view_count, default: 0
      t.string :title

      t.timestamps
    end
    add_index :posts, [:user_id, :created_at]
    add_index :posts, [:topic_id, :created_at]
  end
end
