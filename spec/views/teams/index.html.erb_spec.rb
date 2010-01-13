require 'spec_helper'

describe "/teams/index.html.erb" do
  include TeamsHelper

  before(:each) do
    assigns[:teams] = [
      stub_model(Team,
        :name => "value for name",
        :sms_code => "value for sms_code",
        :game_id => 1
      ),
      stub_model(Team,
        :name => "value for name",
        :sms_code => "value for sms_code",
        :game_id => 1
      )
    ]
  end

  it "renders a list of teams" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for sms_code".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
