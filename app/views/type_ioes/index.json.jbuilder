json.array!(@type_ioes) do |type_io|
  json.extract! type_io, :id, :name, :description
  json.url type_io_url(type_io, format: :json)
end
