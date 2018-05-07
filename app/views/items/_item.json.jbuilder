json.extract! item, :id, :title, :body, :user, :published, :private, :created_at, :updated_at
json.url item_url(item, format: :json)
