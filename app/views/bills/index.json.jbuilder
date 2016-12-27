json.array!(@bills) do |bill|
  json.extract! bill, :id, :date, :to_comp_id, :from_comp_id, :sum, :type_id, :ioe_id, :project_id, :list_id, :description, :user_id
  json.url bill_url(bill, format: :json)
end
