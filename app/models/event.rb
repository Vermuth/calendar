class Event < ActiveRecord::Base
  validates_presence_of :name, :published_on
end
