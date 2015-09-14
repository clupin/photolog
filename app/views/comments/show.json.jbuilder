json.extract! @comment, :id, :user_id, :post_id, :body, :created_at, :updated_at
json.user do
	json.email @comment.user.email
end