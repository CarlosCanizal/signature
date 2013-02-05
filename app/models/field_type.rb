class FieldType < ActiveRecord::Base
  attr_accessible :name
  has_many :fields
end
