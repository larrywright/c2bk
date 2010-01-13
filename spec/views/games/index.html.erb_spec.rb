require 'spec_helper'

describe "/games/index.html.erb" do
  include GamesHelper

  before(:each) do
    assigns[:games] = [
      stub_model(Game,
        :title => "value for title",
        :geo_tl_lat => 9.99,
        :geo_tl_lon => 9.99,
        :geo_br_lat => 9.99,
        :geo_br_lon => 9.99,
        :puppetmaster_id => 1
      ),
      stub_model(Game,
        :title => "value for title",
        :geo_tl_lat => 9.99,
        :geo_tl_lon => 9.99,
        :geo_br_lat => 9.99,
        :geo_br_lon => 9.99,
        :puppetmaster_id => 1
      )
    ]
  end

  it "renders a list of games" do
    render
    response.should have_tag("tr>td", "value for title".to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
