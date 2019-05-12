json.array!(@articles) do |article|
  json.id article.id
  json.user article.user
  json.created_at article.created_at
  json.updated_at article.updated_at
  json.price article.price
  json.title article.title
  json.content article.content
  json.category article.category
  if @current_user.nil?
  json.conversation article.conversations
  end

  json.picture article.picture
end