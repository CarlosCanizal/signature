class CreateApplicantFields < ActiveRecord::Migration
  def change
    create_table :applicant_fields do |t|
      t.integer :applicant_id
      t.integer :field_id
      t.string :value

      t.timestamps
    end
  end
end
