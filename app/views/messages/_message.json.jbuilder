json.extract! message, :id, :sender, :reciever, :text, :created_at, :updated_at
json.url message_url(message, format: :json)
