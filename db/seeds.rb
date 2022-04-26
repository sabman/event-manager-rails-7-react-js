ActiveSupport::JSON.decode(File.read("db/seeds/events.json")).tap do |json|
  json.each do |record|
    Event.create!(record)
  end
end
