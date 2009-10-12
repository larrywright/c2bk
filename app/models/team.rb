class Team < ActiveRecord::Base
  has_and_belongs_to_many :players
  
  validates_presence_of :name, :sms_code
  validates_length_of :name, :within => 5..32
  validates_length_of :sms_code, :is => 2
end
