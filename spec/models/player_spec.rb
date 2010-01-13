require 'spec_helper'

describe Player do
  before(:each) do
    @valid_attributes = {
      :email => "value for email",
      :username => "value for username",
      :password_salt => "value for password_salt",
      :password_hash => "value for password_hash",
      :textmarks_uid => 1,
      :textmarks_phone => "value for textmarks_phone"
    }
  end

  it "should create a new instance given valid attributes" do
    Player.create!(@valid_attributes)
  end
end
