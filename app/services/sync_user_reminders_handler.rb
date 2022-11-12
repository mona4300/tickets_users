class SyncUserRemindersHandler < SyncRemindersHandler
  attr_accessor :changed_options

  def initialize(user, changed_options)
    super(user)

    @changed_options = changed_options
  end

  def sync
    byebug
    if !user.send_due_date_reminder
      user.tickets_reminders.delete_all if user.tickets_reminders.exists?
      return
    end

    changed_options.delete('send_due_date_reminder')
    return if changed_options.blank?

    current_date = starting_date = Time.zone.now.to_date
    expected_today_reminder = set_user_reminder_time(current_date)

    starting_date += 1.day if expected_today_reminder <= Time.zone.now

    future_tickets = user.tickets.after_due_date(
      starting_date
    ).group(:due_date).select(:due_date)

    schedule_reminders(future_tickets)
  end


  def schedule_reminders(future_tickets)
    future_tickets.each do |future_ticket|
      schedule_reminder(future_ticket.due_date)
    end
  end
end