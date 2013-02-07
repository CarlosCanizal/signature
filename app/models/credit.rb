class Credit < ActiveRecord::Base
  attr_accessible :applicant_id, :form_id

  belongs_to :form
  belongs_to :applicant
end
