class CreateCourts < ActiveRecord::Migration
  def change
    create_table :courts do |t|
      t.string :court_location
      t.string :court_address
      t.integer :dress_code_id

      t.timestamps null: false
    end
  end
end
