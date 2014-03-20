class Event < ActiveRecord::Base
  belongs_to :user

  validates :name,        :presence => true
  validates :event_time,  :presence => true

end
