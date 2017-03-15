json.extract! feedback, :id, :user, :goals_for_week, :last_week, :something_small, :created_at, :updated_at
json.url feedback_url(feedback, format: :json)
