json.array!(@messages) do |messages|
  json.id messages.id
  json.body messages.body
  json.user messages.user
  json.read messages.read
end


