json.array!(@trails) do |trail|
  json.extract! trail, :id, :title
  json.url trail_url(trail, format: :json)
end
