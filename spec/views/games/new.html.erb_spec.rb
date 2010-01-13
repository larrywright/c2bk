require 'spec_helper'

describe "/games/new.html.erb" do
  include GamesHelper

  before(:each) do
    assigns[:game] = stub_model(Game,
      :new_record? => true,
      :title => "value for title",
      :geo_tl_lat => 9.99,
      :geo_tl_lon => 9.99,
      :geo_br_lat => 9.99,
      :geo_br_lon => 9.99,
      :puppetmaster_id => 1
    )
  end

  it "renders new game form" do
    render

    response.should have_tag("form[action=?][method=post]", games_path) do
      with_tag("input#game_title[name=?]", "game[title]")
      with_tag("input#game_geo_tl_lat[name=?]", "game[geo_tl_lat]")
      with_tag("input#game_geo_tl_lon[name=?]", "game[geo_tl_lon]")
      with_tag("input#game_geo_br_lat[name=?]", "game[geo_br_lat]")
      with_tag("input#game_geo_br_lon[name=?]", "game[geo_br_lon]")
      with_tag("input#game_puppetmaster_id[name=?]", "game[puppetmaster_id]")
    end
  end
end
