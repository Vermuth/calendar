class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.date :published_od
      t.integer :user_id

      t.timestamps
    end
  end
end
