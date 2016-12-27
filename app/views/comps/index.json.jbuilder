json.array!(@comps) do |comp|
  json.extract! comp, :id, :brand, :name, :description
  json.url comp_url(comp, format: :json)
end
