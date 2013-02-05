class CreateFormFields < ActiveRecord::Migration
  def change
    create_table :form_fields do |t|
      t.integer :form_id
      t.integer :field_id
      t.integer :axis_x
      t.integer :axis_y
      t.integer :width
      t.integer :height
      t.integer :page

      t.timestamps
    end
  end
end
