json.array!(@entries) do |entry|
  json.extract! entry, :id, :date, :task_description, :minutes_worked
  json.url entry_url(entry, format: :json)
end
