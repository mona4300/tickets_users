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
require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
