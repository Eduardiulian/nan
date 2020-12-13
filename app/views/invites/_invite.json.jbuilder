# frozen_string_literal: true

json.extract! invite, :id, :sender, :reciever, :accepted, :created_at, :updated_at
json.url invite_url(invite, format: :json)
