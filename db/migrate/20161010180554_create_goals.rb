class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :title, null: false
      t.text :details
      t.string :visibility, default: "Public"
      t.string :finished?, default: "Ongoing"
      t.integer :cheers
      t.integer :user_id, null: false, index: true

      t.timestamps null: false
    end
  end
end
