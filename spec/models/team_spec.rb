require 'spec_helper'

describe Team do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :sms_code => "value for sms_code",
      :game_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Team.create!(@valid_attributes)
  end
end
