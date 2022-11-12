class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :description
      t.date :due_date
      t.integer :status_id
      t.integer :progress
      t.references :user

      t.timestamps
    end
  end
end
