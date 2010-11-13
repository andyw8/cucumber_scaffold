<%= generated_by %>

Given /^a <%= singular.humanize.downcase %> exists$/ do
  @<%= singular %> = <%= singular.camelcase %>.create!(valid_<%= singular %>_attributes)
end

Then /^I should see the following <%= singular.humanize.downcase %>:$/ do |expected_table|
  
  <% if nifty? %>
  show_fields_css_query = 'body p strong'
  <% else %>
  show_fields_css_query = 'body p b'
  <% end %>
  
  actual_table = tableish(show_fields_css_query, lambda{|label| [label, label.next]})   
  actual = {}
  actual_table.each do |form_entry|
    attr_name = form_entry[0]
    attr_value = form_entry[1]
    actual[attr_name] = attr_value
  end
  assert_equal actual, expected_table.rows_hash
end

Then /^I should see the following <%= plural.humanize.downcase %>:$/ do |expected_table|
  expected_table.diff!(tableish('table tr', 'td,th'))
end

Given /^the following <%= plural.humanize.downcase %>:$/ do |table|
  hashes = replace_spaces_with_underscores_in_keys(table.hashes)
  @<%= plural %> = <%= singular.camelcase %>.create!(hashes)
end

Given /^the following <%= singular.humanize.downcase %>:$/ do |table|
  hashes = replace_spaces_with_underscores_in_keys(table.rows_hash)
  @<%= singular %> = <%= singular.camelcase %>.create!(hashes)
end

def valid_<%= singular %>_attributes
  # You may want to a factory for this
  {}
end
