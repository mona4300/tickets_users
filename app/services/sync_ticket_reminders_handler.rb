class SyncTicketRemindersHandler < SyncRemindersHandler
  attr_accessor :ticket

  def initialize(ticket)
    super(ticket.user)

    @ticket = ticket
  end

  def sync
    return if !user.send_due_date_reminder

    schedule_reminder(ticket.due_date, true)
  end
end