require 'spec_helper'

describe "/players/new.html.erb" do
  include PlayersHelper

  before(:each) do
    assigns[:player] = stub_model(Player,
      :new_record? => true,
      :email => "value for email",
      :username => "value for username",
      :password_salt => "value for password_salt",
      :password_hash => "value for password_hash",
      :textmarks_uid => 1,
      :textmarks_phone => "value for textmarks_phone"
    )
  end

  it "renders new player form" do
    render

    response.should have_tag("form[action=?][method=post]", players_path) do
      with_tag("input#player_email[name=?]", "player[email]")
      with_tag("input#player_username[name=?]", "player[username]")
      with_tag("input#player_password_salt[name=?]", "player[password_salt]")
      with_tag("input#player_password_hash[name=?]", "player[password_hash]")
      with_tag("input#player_textmarks_uid[name=?]", "player[textmarks_uid]")
      with_tag("input#player_textmarks_phone[name=?]", "player[textmarks_phone]")
    end
  end
end
