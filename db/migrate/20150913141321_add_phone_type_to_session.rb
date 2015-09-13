class AddPhoneTypeToSession < ActiveRecord::Migration
  def change
    add_column :sessions, :phone_type, :string
  end
end
