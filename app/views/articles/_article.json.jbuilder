json.extract! article, :id, :title, :body, :posted_date, :created_at, :updated_at
json.url article_url(article, format: :json)
