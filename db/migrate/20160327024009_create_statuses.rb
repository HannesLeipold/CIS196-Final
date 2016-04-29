class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :text
      t.references :user
      t.timestamps null: false
    end
  end
end
