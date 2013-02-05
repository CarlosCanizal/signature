class FormField < ActiveRecord::Base
  attr_accessible :axis_x, :axis_y, :field_id, :form_id, :height, :page, :width
  belongs_to :form
  belongs_to :field
end
