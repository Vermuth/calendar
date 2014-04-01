class Event < ActiveRecord::Base
  include IceCube
  belongs_to :user

  validates :name,        :presence => true
  validates :event_time,  :presence => true
  validates :event_end_time,  :presence => true
  validates :see_all,     :presence => true


  def self.recurring(events)
    events.each do |event|
      unless (event.every_year.nil? && event.every_month.nil? && event.every_week.nil? && event.every_day.nil?)
        rule = Rule.yearly(event.every_year) if event.every_year != nil
        rule = Rule.monthly(event.every_month) if event.every_month != nil
        rule = Rule.weekly(event.every_week) if event.every_week != nil
        rule = Rule.daily(event.every_day) if event.every_day != nil
        schedule = IceCube::Schedule.new(event.event_time)
        schedule.add_recurrence_rule rule
        occurrences = schedule.occurrences_between(schedule.first(2).last, event.event_end_time)
        occurrences.each do |x|
           date = Date.parse x.to_s
           recurring_event = Event.new
           recurring_event.id = event.id
           recurring_event.name = event.name
           recurring_event.user_id = event.user_id
           recurring_event.event_time = date
           events << recurring_event
        end
      end
    end
  end


end
