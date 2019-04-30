json.array!(@conversations) do |conversation|
  json.id conversation.id
  json.sender conversation.sender
  json.receiver conversation.receiver
  json.article conversation.article
end