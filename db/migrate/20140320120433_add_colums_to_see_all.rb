class AddColumsToSeeAll < ActiveRecord::Migration
  def change
    add_column :events, :see_all, :integer
  end
end
