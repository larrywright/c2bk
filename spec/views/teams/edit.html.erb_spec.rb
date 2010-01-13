require 'spec_helper'

describe "/teams/edit.html.erb" do
  include TeamsHelper

  before(:each) do
    assigns[:team] = @team = stub_model(Team,
      :new_record? => false,
      :name => "value for name",
      :sms_code => "value for sms_code",
      :game_id => 1
    )
  end

  it "renders the edit team form" do
    render

    response.should have_tag("form[action=#{team_path(@team)}][method=post]") do
      with_tag('input#team_name[name=?]', "team[name]")
      with_tag('input#team_sms_code[name=?]', "team[sms_code]")
      with_tag('input#team_game_id[name=?]', "team[game_id]")
    end
  end
end
