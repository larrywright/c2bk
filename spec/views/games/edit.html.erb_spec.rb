require 'spec_helper'

describe "/games/edit.html.erb" do
  include GamesHelper

  before(:each) do
    assigns[:game] = @game = stub_model(Game,
      :new_record? => false,
      :title => "value for title",
      :geo_tl_lat => 9.99,
      :geo_tl_lon => 9.99,
      :geo_br_lat => 9.99,
      :geo_br_lon => 9.99,
      :puppetmaster_id => 1
    )
  end

  it "renders the edit game form" do
    render

    response.should have_tag("form[action=#{game_path(@game)}][method=post]") do
      with_tag('input#game_title[name=?]', "game[title]")
      with_tag('input#game_geo_tl_lat[name=?]', "game[geo_tl_lat]")
      with_tag('input#game_geo_tl_lon[name=?]', "game[geo_tl_lon]")
      with_tag('input#game_geo_br_lat[name=?]', "game[geo_br_lat]")
      with_tag('input#game_geo_br_lon[name=?]', "game[geo_br_lon]")
      with_tag('input#game_puppetmaster_id[name=?]', "game[puppetmaster_id]")
    end
  end
end
