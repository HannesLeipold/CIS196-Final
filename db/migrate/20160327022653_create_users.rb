class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.text :info
      t.text :past_courses
      t.boolean :session_exists
      t.timestamps null: false
    end
  end
end
