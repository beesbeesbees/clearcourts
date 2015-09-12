class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.datetime :send_date
      t.integer :session_id

      t.timestamps null: false
    end
  end
end
