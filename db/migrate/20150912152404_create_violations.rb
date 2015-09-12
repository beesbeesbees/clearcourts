class CreateViolations < ActiveRecord::Migration
  def change
    create_table :violations do |t|
      t.string :violation_number
      t.string :citation_id
      t.string :violation_description
      t.boolean :warrant_status
      t.string :status
      t.string :warrant_number
      t.datetime :status_date
      t.integer :fine_amount
      t.integer :court_cost

      t.timestamps null: false
    end
  end
end
