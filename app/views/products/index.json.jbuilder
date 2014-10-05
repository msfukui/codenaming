json.array!(@products) do |product|
  json.extract! product, :id, :name, :version, :path
  json.url product_url(product, format: :json)
end
