class Event < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :name, :published_on
end
