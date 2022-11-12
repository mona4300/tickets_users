class SyncRemindersHandler
  attr_accessor :user

  def initialize(user)
    Time.zone = user.timezone
    
    @user = user
  end

  protected 

  def set_user_reminder_time(date)
    user.due_date_reminder_time.to_time.utc.change(
      year: date.year, month: date.month,
      day: date.day, offset: Time.zone.utc_offset
    )
  end

  def schedule_reminder(due_date, create_only = false)
    byebug
    job_due_date = due_date
    job_due_date -= 1.day if user.due_date_reminder_interval == 1

    reminder_time = set_user_reminder_time(job_due_date)
    tickets_reminder = UserTicketsReminder.find_or_initialize_by(
      due_date: due_date, user_id: user.id
    )

    return if tickets_reminder.persisted? && create_only

    if reminder_time.past?
      tickets_reminder.persisted? && tickets_reminder.destroy
      return
    end

    job_id = TicketsReminderJob.perform_at(
      reminder_time, user.id, due_date.iso8601
    )
    tickets_reminder.update job_id: job_id
  end
end