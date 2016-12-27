json.array!(@members) do |member|
  json.extract! member, :id, :user_id, :project_id, :position
  json.url member_url(member, format: :json)
end
