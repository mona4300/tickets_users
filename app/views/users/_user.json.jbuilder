json.extract! user, :id, :name, :email, :send_due_date_reminder, :due_date_reminder_time, :due_date_reminder_interval, :timezone, :created_at, :updated_at
json.url user_url(user, format: :json)
