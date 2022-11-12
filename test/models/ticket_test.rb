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
require "test_helper"

class TicketTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
