json.array!(@rebuses) do |rebus|
  json.extract! rebus, :id
  json.url rebus_url(rebus, format: :json)
end
