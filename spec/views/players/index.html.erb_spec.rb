require 'spec_helper'

describe "/players/index.html.erb" do
  include PlayersHelper

  before(:each) do
    assigns[:players] = [
      stub_model(Player,
        :email => "value for email",
        :username => "value for username",
        :password_salt => "value for password_salt",
        :password_hash => "value for password_hash",
        :textmarks_uid => 1,
        :textmarks_phone => "value for textmarks_phone"
      ),
      stub_model(Player,
        :email => "value for email",
        :username => "value for username",
        :password_salt => "value for password_salt",
        :password_hash => "value for password_hash",
        :textmarks_uid => 1,
        :textmarks_phone => "value for textmarks_phone"
      )
    ]
  end

  it "renders a list of players" do
    render
    response.should have_tag("tr>td", "value for email".to_s, 2)
    response.should have_tag("tr>td", "value for username".to_s, 2)
    response.should have_tag("tr>td", "value for password_salt".to_s, 2)
    response.should have_tag("tr>td", "value for password_hash".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for textmarks_phone".to_s, 2)
  end
end
