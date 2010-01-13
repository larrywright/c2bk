class Player < ActiveRecord::Base
  validates_presence_of :email
  validates_presence_of :username
  validates_uniqueness_of :textmarks_phone, :allow_blank => true, :message => "This phone is already linked to an account"
  validates_uniqueness_of :textmarks_uid, :allow_blank => true, :message => "This textmarks account is already linked to an account"
  
  has_and_belongs_to_many :teams
  has_many :games
  
  def password=(pass)
    salt = [Array.new(6){rand(256).chr}.join].pack("m").chomp
    self.password_salt, self.password_hash = salt, Digest::SHA256.hexdigest(pass + salt)
  end
end
