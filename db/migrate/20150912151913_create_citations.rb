class CreateCitations < ActiveRecord::Migration
  def change
    create_table :citations do |t|
      t.integer :citation_number
      t.datetime :citation_date
      t.string :first_name
      t.string :last_name
      t.datetime :date_of_birth
      t.string :defendant_address
      t.string :defendant_city
      t.string :defendant_state
      t.string :drivers_license_number
      t.integer :court_id
      t.datetime :court_date

      t.timestamps null: false
    end
  end
end
