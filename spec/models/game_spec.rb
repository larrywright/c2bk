require 'spec_helper'

describe Game do
  before(:each) do
    @valid_attributes = {
      :title => "value for title",
      :geo_tl_lat => 9.99,
      :geo_tl_lon => 9.99,
      :geo_br_lat => 9.99,
      :geo_br_lon => 9.99,
      :start => Time.now,
      :puppetmaster_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Game.create!(@valid_attributes)
  end
end
