class ApplicantField < ActiveRecord::Base
  attr_accessible :applicant_id, :field_id, :value

  belongs_to :applicant
  belongs_to :field
end
