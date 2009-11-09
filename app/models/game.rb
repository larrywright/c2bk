class Game < ActiveRecord::Base
  belongs_to :puppetmaster,
    :class_name => "Player",
    :foreign_key => "player_id"
    
  has_many :teams
end
