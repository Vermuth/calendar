json.array!(@events) do |event|
json.extract! event, :id, :name
json.title event.name
json.start event.event_time
json.url event_url(event, format: :html)
end