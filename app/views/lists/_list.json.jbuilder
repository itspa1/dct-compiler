json.extract! list, :id, :title, :user_id, :tags_list, :created_at, :updated_at
json.url list_url(list, format: :json)
