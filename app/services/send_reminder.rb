class SendReminder
  attr_accessor :user, :due_date

  def initialize(user, due_date)
    @user = user
    @due_date = due_date
  end

  def send
    byebug
    tickets_count = user.tickets.where(due_date: due_date).count

    return if tickets_count.zero?
    # TODO send email
    puts "You have #{tickets_count} with due date #{due_date}"
  end
end