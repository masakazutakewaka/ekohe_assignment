json.extract! article, :id, :title, :content, :user_id, :publish_flag, :published_at, :created_at, :updated_at
json.url article_url(article, format: :json)
