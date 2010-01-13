Given /^the following teams:$/ do |teams|
  Team.create!(teams.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) team$/ do |pos|
  visit teams_url
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following teams:$/ do |expected_teams_table|
  expected_teams_table.diff!(tableish('table tr', 'td,th'))
end
