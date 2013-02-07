class Field < ActiveRecord::Base
  attr_accessible :field_type_id, :name

  belongs_to :field_type

  has_many :form_fields
  has_many :forms, through: :form_fields

  has_many :applicant_fields
  has_many :applicants, through: :applicant_fields
end
