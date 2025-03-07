json.extract! memory, :id, :title, :content, :user_id, :restaurant_id, :created_at, :updated_at
json.url user_memory_url(user_id: memory.user.id, id: memory.id, format: :json)
