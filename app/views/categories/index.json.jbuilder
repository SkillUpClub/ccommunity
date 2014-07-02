json.array!(@categories) do |category|
  json.extract! category, :id, :title, :url
  json.url category_url(category, format: :json)
end
