json.array!(@posts) do |post|
  json.extract! post, :id, :board_id, :title, :text, :name, :email, :deleted_at
  json.url post_url(post, format: :json)
end
