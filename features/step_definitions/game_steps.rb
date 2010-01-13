Given /^the following games:$/ do |games|
  Game.create!(games.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) game$/ do |pos|
  visit games_url
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following games:$/ do |expected_games_table|
  expected_games_table.diff!(tableish('table tr', 'td,th'))
end
