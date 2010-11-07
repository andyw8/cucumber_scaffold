<%= generated_by %>

Given /^a <%= singular %> exists$/ do
  @<%= singular %> = <%= singular_title %>.create!(valid_<%= singular %>_attributes)
end

Then /^I should see the following <%= singular %>:$/ do |expected_table|
  
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

Then /^I should see the following <%= plural %>:$/ do |expected_table|
  expected_table.diff!(tableish('table tr', 'td,th'))
end

Given /^the following <%= plural %>:$/ do |table|
  @<%= plural %> = <%= singular_title %>.create!(table.hashes)
end

Given /^the following <%= singular %>:$/ do |table|
  @<%= singular %> = <%= singular_title %>.create!(table.rows_hash)
end

def valid_<%= singular %>_attributes
  # You may want to a factory for this
  {}
end
