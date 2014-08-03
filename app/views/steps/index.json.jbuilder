json.array!(@steps) do |step|
  json.extract! step, :id, :title
  json.url step_url(step, format: :json)
end
