class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.datetime :expiration
      t.string :phone_number
      t.string :email
      t.string :contact_method

      t.timestamps null: false
    end
  end
end
