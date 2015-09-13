class AddCitNumToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :citation_number, :string
  end
end
