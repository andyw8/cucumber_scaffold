<%= generated_by %>
<%
update_button_title = 'Update'
create_button_title = 'Create'

if nifty?
  successful_update_message = "Successfully updated #{singular}."
  successful_create_message = "Successfully created #{singular}."
  successful_destroy_message = "Successfully destroyed #{singular}."
  new_heading = "New #{singular_title}"
  edit_heading = "Edit #{singular_title}"
  index_heading = plural_title
  show_heading = singular_title
  new_title = new_heading
  edit_title = edit_heading
  index_title = index_heading
  show_title = show_heading
  back_to_all = 'Back to List'
  problems_intro = 'Correct the following errors and try again.'
else
  problems_intro = 
  successful_update_message = "#{singular_title} was successfully updated."
  successful_create_message = "#{singular_title} was successfully created."
  index_heading = "Listing #{plural}"
  edit_heading = "Editing #{singular}"
  new_heading = "New #{singular}"
  back_to_all = 'Back'
  problems_intro = "prohibited this #{singular} from being saved:"
end

pending_explanation_1 = "You should use this scenario as the basis for scenarios involving ActiveRecord validations, or delete it if it's not required"
pending_explanation_2 = "[You should add checks for specific errors here. It may be appropriate to add extra scenarios.]"
-%>

Feature: Manage <%= plural_title.humanize.downcase %>
  In order to [goal]
  [stakeholder]
  wants [behaviour]

    <%= tags('@index') %>
    Scenario: List all <%= plural.humanize.downcase %>
      Given the following <%= plural.humanize.downcase %>:
        <%= activerecord_table_header_row %> 
        <%= activerecord_table_row(:index => 1) %> 
        <%= activerecord_table_row(:index => 2) %> 
        <%= activerecord_table_row(:index => 3) %> 
      When I go to the <%= plural.humanize.downcase %> page
      Then I should see the following <%= plural.humanize.downcase %>:
        <%= html_table_header_row %> 
        <%= html_table_row(:index => 1) %> 
        <%= html_table_row(:index => 2) %> 
        <%= html_table_row(:index => 3) %> 

    <%= tags('@show') %>
    Scenario: View a <%= singular.humanize.downcase %>
      Given the following <%= singular.humanize.downcase %>:
        <%= activerecord_single_resource %>
      When I go to the page for that <%= singular.humanize.downcase %>
      Then I should see the following <%= singular.humanize.downcase %>:
        <%= html_single_resource %>

    <%= tags('@edit') %>
    Scenario: Edit a <%= singular.humanize.downcase %>
      Given the following <%= singular.humanize.downcase %>:
        <%= activerecord_single_resource %>
      When I go to the edit page for that <%= singular.humanize.downcase %>
      Then I should see the following form field values:
        <%= form_single_resource %>

    <%= tags('@index @destroy') %>
    Scenario: Delete a <%= singular.humanize.downcase %> via the index page
      Given the following <%= plural.humanize.downcase %>:
        <%= activerecord_table_header_row %> 
        <%= activerecord_table_row(:index => 1) %> 
        <%= activerecord_table_row(:index => 2) %> 
        <%= activerecord_table_row(:index => 3) %>
      When I go to the <%= plural.humanize.downcase %> page
      And I click "Destroy" in the 2nd row
      Then I should see the following <%= plural.humanize.downcase %>:
        <%= html_table_header_row %> 
        <%= activerecord_table_row(:index => 1) %> 
        <%= activerecord_table_row(:index => 3) %>
      And I should be on the <%= plural.humanize.downcase %> page
      <% if successful_destroy_message %>
      And I should see "<%= successful_destroy_message %>"
      <% end -%>

    <% if nifty? %>
    <%= tags('@show @destroy @index') %>
    Scenario: Delete a <%= singular.humanize.downcase %> via the show page
      Given the following <%= plural.humanize.downcase %>:
        <%= activerecord_table_header_row %> 
        <%= activerecord_table_row(:index => 1) %> 
        <%= activerecord_table_row(:index => 2) %> 
        <%= activerecord_table_row(:index => 3) %>
      When I go to the page for the 2nd post
      And I follow "Destroy"
      Then I should see the following <%= plural.humanize.downcase %>:
        <%= html_table_header_row %> 
        <%= activerecord_table_row(:index => 1) %> 
        <%= activerecord_table_row(:index => 3) %>
      And I should be on the <%= plural.humanize.downcase %> page
      And I should see "<%= successful_destroy_message %>"
      <% end -%>

    <%= tags('@new @create @show') %>
    Scenario: Create a new <%= singular.humanize.downcase %>
      Pending
      # Given I am on the new <%= singular.humanize.downcase %> page
      # When I fill in the form with:
      #   <%= form_single_resource_commented %>
      # And I press "<%= create_button_title %>"
      # Then I should see "<%= successful_create_message %>"
      # And I should see the following <%= singular.humanize.downcase %>:
      #   <%= html_single_resource_commented %>
      #
      # In order to confirm that the user is redirected to the correct page
      # after create, you'll need to add an entry to paths.rb to uniquely
      # find a <%= singular.humanize.downcase %>, e.g.:
      #
      #   when /page for the <%= singular.humanize.downcase %> with name "([^"]*)"$/
      #     conditions = { :conditions => {:name => $1} }
      #     matches = <%= singular.camelcase %>.all(conditions)
      #     if matches.size == 0
      #       raise "Could not find any <%= plural.humanize.downcase %> using criteria #{conditions.inspect}"
      #     elsif matches.size > 1
      #       raise "Could not find a unique <%= singular.humanize.downcase %> using criteria #{conditions.inspect} (#{matches.size} matches)"
      #     end
      #     <%= singular %>_path(matches.first)
      #
      # Then add a step such as this to the scenario:
      #
      #   And I should be on the page for the <%= singular.humanize.downcase %> with name "..."

    <%= tags('@new @create') %>
    Scenario: Attempt to create a new <%= singular.humanize.downcase %> with invalid input
      Pending
      # <%= pending_explanation_1 %>
      # Given I am on the new <%= singular.humanize.downcase %> page
      # When I fill in the form with:
      #   <%= form_single_resource_commented %>
      # And I press "<%= create_button_title %>"
      # Then I should see "<%= problems_intro %>"
      #
      # <%= pending_explanation_2 %>
      #
      # And I should see the following form field values:
      #   <%= form_single_resource_commented %>

    <%= tags('@edit @update') %>
    Scenario: Attempt to update a <%= singular.humanize.downcase %> with invalid input
      Pending
      # <%= pending_explanation_1 %>
      # Given a <%= singular.humanize.downcase %> exists
      # When I go to the edit page for that <%= singular.humanize.downcase %>
      # And I fill in the form with:
      #   <%= form_single_resource_commented %>
      # And I press "<%= update_button_title %>"
      # Then I should see "<%= problems_intro %>"
      #
      # <%= pending_explanation_2 %>
      #
      # And I should see the following form field values:
      #   <%= form_single_resource_commented %>

    <%= tags('@edit @update @show') %>
    Scenario: Update a <%= singular.humanize.downcase %>
      Given the following <%= singular.humanize.downcase %>:
        <%= activerecord_single_resource %>
      When I go to the edit page for that <%= singular.humanize.downcase %>
      And I fill in the form with:
        <%= form_single_resource_updated %> 
      And I press "<%= update_button_title %>"
      Then I should be on the page for that <%= singular.humanize.downcase %>
      And I should see "<%= successful_update_message %>"
      And I should see the following <%= singular.humanize.downcase %>:
        <%= html_single_resource_updated %>

    <%= tags('@index @new') %>
    Scenario: Navigate from the <%= plural.humanize.downcase %> page to the new <%= singular.humanize.downcase %> page
      Given I am on the <%= plural.humanize.downcase %> page
      When I follow "New <%= singular_title %>"
      Then I should be on the new <%= singular.humanize.downcase %> page

    <%= tags('@index @show') %>
    Scenario: Navigate from <%= plural.humanize.downcase %> page to the show <%= singular.humanize.downcase %> page
      Given the following <%= plural.humanize.downcase %>:
        <%= activerecord_table_header_row %>
        <%= activerecord_table_row(:index => 1) %> 
        <%= activerecord_table_row(:index => 2) %>
        <%= activerecord_table_row(:index => 3) %>
      When I go to the <%= plural.humanize.downcase %> page
      And I click "Show" in the 2nd row
      Then I should be on the page for the 2nd <%= singular.humanize.downcase %>

    <%= tags('@index @edit') %>
    Scenario: Navigate from <%= plural.humanize.downcase %> page to the edit <%= singular.humanize.downcase %> page
      Given the following <%= plural.humanize.downcase %>:
        <%= activerecord_table_header_row %> 
        <%= activerecord_table_row(:index => 1) %> 
        <%= activerecord_table_row(:index => 2) %> 
        <%= activerecord_table_row(:index => 3) %>
      When I go to the <%= plural.humanize.downcase %> page
      And I click "Edit" in the 2nd row
      Then I should be on the edit page for the 2nd <%= singular.humanize.downcase %>

    <%= tags('@new @index') %>
    Scenario: Navigate from new <%= singular.humanize.downcase %> page to <%= plural.humanize.downcase %> page
      Given I am on the new <%= singular.humanize.downcase %> page
      When I follow "<%= back_to_all %>"
      Then I should be on the <%= plural.humanize.downcase %> page

    <%= tags('@edit @show') %>
    Scenario: Navigate from the edit <%= singular.humanize.downcase %> page to the show <%= singular.humanize.downcase %> page
      Given a <%= singular.humanize.downcase %> exists
      When I go to the edit page for that <%= singular.humanize.downcase %>
      And I follow "Show"
      Then I should be on the page for that <%= singular.humanize.downcase %>

    <%= tags('@edit @index') %>
    Scenario: Navigate from edit <%= singular.humanize.downcase %> page to the <%= plural.humanize.downcase %> page
      Given a <%= singular.humanize.downcase %> exists
      When I go to the edit page for that <%= singular.humanize.downcase %>
      And I follow "<%= back_to_all %>"
      Then I should be on the <%= plural.humanize.downcase %> page

    <%= tags('@show @edit') %>
    Scenario: Navigate from show <%= singular.humanize.downcase %> page to edit <%= singular.humanize.downcase %> page
      Given a <%= singular.humanize.downcase %> exists
      When I go to the page for that <%= singular.humanize.downcase %>
      And I follow "Edit"
      Then I should be on the edit page for that <%= singular.humanize.downcase %>

    <%= tags('@show @index') %>
    Scenario: Navigate from show <%= singular.humanize.downcase %> page to <%= plural.humanize.downcase %> page
      Given a <%= singular.humanize.downcase %> exists
      When I go to the page for that <%= singular.humanize.downcase %>
      <% if nifty? %>
      And I follow "View All"
      <% else %>
      And I follow "Back"
      <% end %>
      Then I should be on the <%= plural.humanize.downcase %> page

    <%= tags('@index') %>
    Scenario: <%= plural_title %> page title
      When I go to the <%= plural.humanize.downcase %> page
      Then the heading should be "<%= index_heading %>"
      <% if index_title %>
      And the title should be "<%= index_title %>"
      <% end -%>

    <% if show_heading || index_title %>
    <%= tags('@show') %>
    Scenario: <%= singular_title %> page title
      Given a <%= singular.humanize.downcase %> exists
      When I go to the page for that <%= singular %>
      <% if show_heading -%>
      Then the heading should be "<%= show_heading %>"
      <% end -%>
      <% if index_title -%>
      And the title should be "<%= show_title %>"
      <% end -%>
    <% end -%>

    <%= tags('@new') %>
    Scenario: New <%= singular.humanize.downcase %> page title
      When I go to the new <%= singular.humanize.downcase %> page
      Then the heading should be "<%= new_heading %>"
      <% if index_title %>
      And the title should be "<%= new_title %>"
      <% end -%>

    <%= tags('@edit') %>
    Scenario: Edit <%= singular.humanize.downcase %> page title
      Given a <%= singular.humanize.downcase %> exists
      When I go to the edit page for that <%= singular.humanize.downcase %>
      Then the heading should be "<%= edit_heading %>"
      <% if index_title %>
      And the title should be "<%= edit_title %>"
      <% end %>
