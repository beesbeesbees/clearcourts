class RemoveExpirationFromSessions < ActiveRecord::Migration
  def up
    remove_column :sessions, :expiration
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
