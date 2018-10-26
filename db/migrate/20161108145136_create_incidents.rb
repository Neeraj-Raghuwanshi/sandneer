class CreateIncidents < ActiveRecord::Migration
  def change
    create_table :incidents do |t|
      t.string :entry_no
      t.text :description
      t.string :place_of_incident
      t.string :incident_type
      t.datetime :incident_date
      t.text :action_taken
      t.boolean :first_aid
      t.text :concerned_notes
      t.string :reported_by

      t.timestamps null: false
    end
  end
end
