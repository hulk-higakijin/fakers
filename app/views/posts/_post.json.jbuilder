json.extract! post, :id, :content, :user_id, :post_likes_count, :reposts_count, :comments_count, :created_at, :updated_at
json.url post_url(post, format: :json)
