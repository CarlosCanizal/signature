class CreateCredits < ActiveRecord::Migration
  def change
    create_table :credits do |t|
      t.integer :form_id
      t.integer :applicant_id

      t.timestamps
    end
  end
end
