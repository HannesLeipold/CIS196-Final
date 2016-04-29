class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :author
      t.integer :period
      t.integer :guest_id
      t.references :user
      t.timestamps null: false
    end
  end
end
