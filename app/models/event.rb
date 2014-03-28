class Event < ActiveRecord::Base
  belongs_to :user

  validates :name,        :presence => true
  validates :event_time,  :presence => true
  validates :see_all,     :presence => true
  validates :every_day,   :presence => true
  validates :every_week,  :presence => true
  validates :every_month, :presence => true
  validates :every_year,  :presence => true

end
