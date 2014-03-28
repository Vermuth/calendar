class AddEveryDayWeekMonthYear < ActiveRecord::Migration
  def change
    add_column :events, :every_day,   :integer
    add_column :events, :every_week,  :integer
    add_column :events, :every_month, :integer
    add_column :events, :every_year,  :integer
  end
end
