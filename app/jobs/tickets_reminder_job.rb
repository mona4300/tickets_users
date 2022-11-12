class TicketsReminderJob
  include Sidekiq::Job

  def perform(user_id, due_date)
    user = User.find_by(id: user_id)
    return unless user.present?

    current_job_exists = user.tickets_reminders.exists?(
      due_date: due_date, job_id: jid
    )
    return unless current_job_exists

    sender = SendReminder.new(user, Date.parse(due_date))
    sender.send
  end
end