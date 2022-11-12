# == Schema Information
#
# Table name: tickets
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  due_date    :date
#  status_id   :integer
#  progress    :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Ticket < ApplicationRecord
  belongs_to :user

  scope :after_due_date, ->(starting_date) {
    where('due_date >= ?', starting_date)
  }

  after_commit :sync_tickets_reminders, on: %i[update create]

  protected

  def sync_tickets_reminders
    byebug
    options = previous_changes.keys.intersection(%w[user_id due_date])
    return if options.blank?
    
    SyncTicketRemindersJob.perform_async(id)
  end
end
