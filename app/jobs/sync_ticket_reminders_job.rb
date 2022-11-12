class SyncTicketRemindersJob
  include Sidekiq::Job

  def perform(ticket_id)
    ticket = Ticket.find_by(id: ticket_id)
    return unless ticket.present?

    SyncTicketRemindersHandler.new(ticket).sync
  end
end