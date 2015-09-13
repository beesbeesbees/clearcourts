class AddFirstAndLastNamesToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :first_name, :string
    add_column :sessions, :last_name, :string
  end
end
