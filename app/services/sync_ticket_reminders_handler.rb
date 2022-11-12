class SyncTicketRemindersHandler < SyncRemindersHandler
  attr_accessor :ticket

  def initialize(ticket)
    super(ticket.user)

    @ticket = ticket
  end

  def sync
    schedule_reminder(ticket.due_date, true)
  end
end