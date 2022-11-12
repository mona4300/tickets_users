# == Schema Information
#
# Table name: user_tickets_reminders
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  job_id     :string
#  due_date   :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class UserTicketsReminder < ApplicationRecord
  belongs_to :user
end
