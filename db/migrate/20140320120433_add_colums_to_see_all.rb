class AddColumsToSeeAll < ActiveRecord::Migration
  def change
    add_column :events, :see_all, :boolean
  end
end
