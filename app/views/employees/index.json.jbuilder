json.array!(@employees) do |employee|
  json.extract! employee, :id, :name, :lastname, :secondname, :salary, :position
  json.url employee_url(employee, format: :json)
end
