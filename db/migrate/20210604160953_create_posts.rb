class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :slug, null: false
      t.string :excerpt
      t.text :content
      t.boolean :published
      t.datetime :published_at
      t.string :meta_keywords
      t.text :meta_description
      t.references :author, index: true, foreign_key: { to_table: :users }

      t.timestamps
    end

    add_index :posts, :title
    add_index :posts, :slug, unique: true
    add_index :posts, :published
  end
end
