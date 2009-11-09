class Player < ActiveRecord::Base
  validates_presence_of :email
  validates_presence_of :username
  
  has_and_belongs_to_many :teams
  has_many :games
end
