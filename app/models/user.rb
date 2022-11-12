# == Schema Information
#
# Table name: users
#
#  id                         :integer          not null, primary key
#  name                       :string
#  email                      :string
#  send_due_date_reminder     :boolean
#  due_date_reminder_time     :time
#  due_date_reminder_interval :integer
#  timezone                   :string
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#
class User < ApplicationRecord
  has_many :tickets
  has_many :tickets_reminders, class_name: 'UserTicketsReminder'

  after_commit :sync_tickets_reminders, on: :update

  def reminder_options
    %w[
      send_due_date_reminder
      due_date_reminder_time
      due_date_reminder_interval
      timezone
    ]
  end

  protected

  def sync_tickets_reminders
    byebug
    options = previous_changes.keys.intersection(reminder_options)
    return if options.blank?

    SyncUserRemindersJob.perform_async(id, options)
  end
end
