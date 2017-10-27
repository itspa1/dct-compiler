json.extract! assignment, :id, :title, :body, :url, :created_at, :updated_at
json.url assignment_url(assignment, format: :json)
