require 'spec_helper'

describe "/teams/show.html.erb" do
  include TeamsHelper
  before(:each) do
    assigns[:team] = @team = stub_model(Team,
      :name => "value for name",
      :sms_code => "value for sms_code",
      :game_id => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ sms_code/)
    response.should have_text(/1/)
  end
end
