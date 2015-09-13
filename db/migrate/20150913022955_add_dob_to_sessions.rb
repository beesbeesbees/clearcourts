class AddDobToSessions < ActiveRecord::Migration
  def change
  	add_column :sessions, :birth_day, :integer
    add_column :sessions, :birth_month, :integer
    add_column :sessions, :birth_year, :integer
  end
end
