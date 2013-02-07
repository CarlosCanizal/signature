class Applicant < ActiveRecord::Base
  attr_accessible :username

  has_many :credits
  has_many :forms, through: :credits

  has_many :applicant_fields
  has_many :fields, through: :applicant_fields
end
