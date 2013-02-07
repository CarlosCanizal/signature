class Form < ActiveRecord::Base
  attr_accessible :bank_id, :name
  belongs_to :bank

  has_many :form_fields
  has_many :fields, through: :form_fields

  has_many :credits
  has_many :applicants, through: :credits
end
