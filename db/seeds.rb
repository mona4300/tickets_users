# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user_1 = User.create!(
  name: 'Mona Helal', email: 'mona@mail.com',
  send_due_date_reminder: true, due_date_reminder_time: '15:00:00',
  due_date_reminder_interval: 0, timezone: 'Cairo'
)

ticket_1 = user_1.tickets.create!(
  title: 'Ticket 1', description: 'Ticket Description 1',
  due_date: Date.today, status_id: 2, progress: 30,
  user_id: user_1.id
)

ticket_2 = user_1.tickets.create!(
  title: 'Ticket 2', description: 'Ticket Description 2',
  due_date: Date.tomorrow, status_id: 2
  progress: 30, user_id: user_1.id
)


user_2 = User.create!(
  name: 'Hazem Belal', email: 'hazem@mail.com',
  send_due_date_reminder: true, due_date_reminder_time: '16:00:00',
  due_date_reminder_interval: 1, timezone: 'Cairo'
)


