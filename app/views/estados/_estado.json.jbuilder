json.extract! user, 
    :id, :email, :encrypted_passaword, :reset_password_token, 
    :reset_password_present_at, :remember_created_at,
    :created_at, :updated_at
json.url estado_url(user, format: :json)
