When /^I click "([^"]*)" in the (\d+)(?:st|nd|rd|th) row$/ do |link, pos|
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link link
  end
end

Then /^the heading should be "([^"]*)"$/ do |heading|
  Then %{I should see "#{heading}" within "h1"}
end

Then /^the title should be "([^"]*)"$/ do |title|
  Then %{I should see "#{title}" within "title"}
end

When /^I should see the following form field values:$/ do |table|
  form_fields = tableish('form label', lambda{ |label| [label, form_field_for_label(label)]})
  form_fields_hash = {}
  form_fields.each do |form_field|
    attr_name = form_field[0]
    attr_value = form_field[1]
    form_fields_hash[attr_name] = attr_value
  end
  assert_equal table.rows_hash, form_fields_hash
end

def form_field_for_label(label)
  input_tags = label.parent.css('input,textarea')
  return if input_tags.size == 0
  # rails renders a hidden input alongside each checkbox
  input_tag = input_tags.last
  if input_tags.size > 1 && input_tag['type'] != 'checkbox'
    raise "Wrong number of input tags while parsing form (found #{input_tags.size})"
  end
  if input_tag.name == 'textarea'
    input_tag.inner_html
  elsif input_tag.name == 'input'
    if input_tag['type'] == 'checkbox'
      input_tag['checked'] == 'checked' ? '[x]' : '[ ]'
    else
      input_tag['value']
    end
  end
end

When /^(?:|I )fill in the form with(?: within "([^"]*)")?:$/ do |selector, fields|
  with_scope(selector) do
    fields.rows_hash.each do |name, value|
      # assume it's a checkbox
      if value == '[x]'
        When %{I check "#{name}"}
      elsif value == '[ ]'
        When %{I uncheck "#{name}"}
      else
        When %{I fill in "#{name}" with "#{value}"}
      end
    end
  end
end