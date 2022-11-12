class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.boolean :send_due_date_reminder
      t.time :due_date_reminder_time
      t.integer :due_date_reminder_interval
      t.string :timezone

      t.timestamps
    end
  end
end
