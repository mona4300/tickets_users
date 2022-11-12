class CreateUserTicketsReminders < ActiveRecord::Migration[7.0]
  def change
    create_table :user_tickets_reminders do |t|
      t.references :user
      t.string :job_id
      t.date :due_date 

      t.timestamps
    end
  end
end
