class CreateChatrooms < ActiveRecord::Migration
  def change
    create_table :chatrooms do |t|
      t.boolean :exists
      t.boolean :visited
      t.integer :duration
      t.integer :user_id
      t.integer :guest_id
      t.timestamps null: false
    end
  end
end
