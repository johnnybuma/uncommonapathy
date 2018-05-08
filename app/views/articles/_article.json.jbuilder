json.extract! article, :id, :title, :subtitle, :slug, :body, :keyword, :created_at, :updated_at
json.url article_url(article, format: :json)
