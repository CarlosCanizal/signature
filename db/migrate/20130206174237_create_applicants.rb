class CreateApplicants < ActiveRecord::Migration
  def change
    create_table :applicants do |t|
      t.string :username

      t.timestamps
    end
  end
end
