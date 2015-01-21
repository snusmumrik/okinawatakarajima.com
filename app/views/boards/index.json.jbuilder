json.array!(@boards) do |board|
  json.extract! board, :id, :category, :name, :deleted_at
  json.url board_url(board, format: :json)
end
