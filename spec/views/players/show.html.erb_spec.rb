require 'spec_helper'

describe "/players/show.html.erb" do
  include PlayersHelper
  before(:each) do
    assigns[:player] = @player = stub_model(Player,
      :email => "value for email",
      :username => "value for username",
      :password_salt => "value for password_salt",
      :password_hash => "value for password_hash",
      :textmarks_uid => 1,
      :textmarks_phone => "value for textmarks_phone"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ email/)
    response.should have_text(/value\ for\ username/)
    response.should have_text(/value\ for\ password_salt/)
    response.should have_text(/value\ for\ password_hash/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ textmarks_phone/)
  end
end
