require 'spec_helper'

describe "/games/show.html.erb" do
  include GamesHelper
  before(:each) do
    assigns[:game] = @game = stub_model(Game,
      :title => "value for title",
      :geo_tl_lat => 9.99,
      :geo_tl_lon => 9.99,
      :geo_br_lat => 9.99,
      :geo_br_lon => 9.99,
      :puppetmaster_id => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ title/)
    response.should have_text(/9\.99/)
    response.should have_text(/9\.99/)
    response.should have_text(/9\.99/)
    response.should have_text(/9\.99/)
    response.should have_text(/1/)
  end
end
