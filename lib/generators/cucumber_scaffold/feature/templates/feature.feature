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
  problems_intro = "1 error prohibited this #{singular} from being saved:"
end

pending_explanation_1 = "You should use this scenario as the basis for scenarios involving ActiveRecord validations, or delete it if it's not required"
pending_explanation_2 = "[You should add checks for specific errors here. It may be appropriate to add extra scenarios.]"
-%>

Feature: Manage <%= plural_title.humanize.downcase %>
  In order to [goal]
  [stakeholder]
  wants [behaviour]

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
      And the heading should be "<%= index_heading %>"
      <% if index_title %>
      And the title should be "<%= index_title %>"
      <% end %>

    Scenario: View a <%= singular.humanize.downcase %>
      Given the following <%= plural.humanize.downcase %>:
        <%= activerecord_table_header_row %>
        <%= activerecord_table_row(:index => 1) %> 
        <%= activerecord_table_row(:index => 2) %>
        <%= activerecord_table_row(:index => 3) %>
      When I go to the <%= plural.humanize.downcase %> page
      And I click "Show" in the 2nd row
      Then I should see the following <%= singular.humanize.downcase %>:
        <%= html_single_resource(:index => 2) %>
      <% if show_heading -%>
      And the heading should be "<%= show_heading %>"
      <% end -%>
      <% if index_title -%>
      And the title should be "<%= show_title %>"
      <% end -%>
      <% if nifty? %>
      When I follow "View All"
      <% else %>
      When I follow "Back"
      <% end %>
      Then I should be on the <%= plural.humanize.downcase %> page

    Scenario: Edit a <%= singular.humanize.downcase %>
      Given the following <%= singular.humanize.downcase %>:
        <%= activerecord_single_resource %>
      When I go to the page for that <%= singular.humanize.downcase %>
      And I follow "Edit"
      Then I should see the following form field values:
        <%= form_single_resource %>
      Then the heading should be "<%= edit_heading %>"
      <% if index_title %>
      And the title should be "<%= edit_title %>"
      <% end %>
      When I follow "Show"
      Then I should be on the page for that <%= singular.humanize.downcase %>

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

    Scenario: New <%= singular.humanize.downcase %> page  
      Given I am on the <%= plural.humanize.downcase %> page
      When I follow "New <%= singular_title %>"
      Then I should be on the new <%= singular.humanize.downcase %> page
      <% if new_title %>
      And the title should be "<%= new_title %>"
      <% end %>
      When I follow "<%= back_to_all %>"
      Then I should be on the <%= plural.humanize.downcase %> page

    Scenario: Create a new <%= singular.humanize.downcase %>
      Pending
      # Given I am on the new <%= singular.humanize.downcase %> page
      # When I fill in the form with:
      #   <%= form_single_resource(:commented => true) %>
      # And I press "<%= create_button_title %>"
      # Then I should see "<%= successful_create_message %>"
      # And I should see the following <%= singular.humanize.downcase %>:
      #   <%= html_single_resource(:commented => true) %>

    Scenario: Attempt to create a new <%= singular.humanize.downcase %> with invalid input
      Pending
      # <%= pending_explanation_1 %>
      # Given I am on the new <%= singular.humanize.downcase %> page
      # When I fill in the form with:
      #   <%= form_single_resource(:commented => true) %>
      # And I press "<%= create_button_title %>"
      # Then I should see "<%= problems_intro %>"
      #
      # <%= pending_explanation_2 %>
      #
      # And I should see the following form field values:
      #   <%= form_single_resource(:commented => true) %>

    Scenario: Attempt to update a <%= singular.humanize.downcase %> with invalid input
      Pending
      # <%= pending_explanation_1 %>
      # Given a <%= singular.humanize.downcase %> exists
      # When I go to the edit page for that <%= singular.humanize.downcase %>
      # And I fill in the form with:
      #   <%= form_single_resource(:commented => true) %>
      # And I press "<%= update_button_title %>"
      # Then I should see "<%= problems_intro %>"
      #
      # <%= pending_explanation_2 %>
      #
      # And I should see the following form field values:
      #   <%= form_single_resource(:commented => true) %>

    Scenario: Update a <%= singular.humanize.downcase %>
      Given the following <%= singular.humanize.downcase %>:
        <%= activerecord_single_resource %>
      When I go to the edit page for that <%= singular.humanize.downcase %>
      And I fill in the form with:
        <%= form_single_resource(:updated => true) %> 
      And I press "<%= update_button_title %>"
      Then I should be on the page for that <%= singular.humanize.downcase %>
      And I should see "<%= successful_update_message %>"
      And I should see the following <%= singular.humanize.downcase %>:
        <%= html_single_resource(:updated => true) %>

    Scenario: Navigate from <%= plural.humanize.downcase %> page to the edit <%= singular.humanize.downcase %> page
      Given the following <%= plural.humanize.downcase %>:
        <%= activerecord_table_header_row %> 
        <%= activerecord_table_row(:index => 1) %> 
        <%= activerecord_table_row(:index => 2) %> 
        <%= activerecord_table_row(:index => 3) %>
      When I go to the <%= plural.humanize.downcase %> page
      And I click "Edit" in the 2nd row
      Then I should be on the edit page for the 2nd <%= singular.humanize.downcase %>

    Scenario: Navigate from edit <%= singular.humanize.downcase %> page to the <%= plural.humanize.downcase %> page
      Given a <%= singular.humanize.downcase %> exists
      When I go to the edit page for that <%= singular.humanize.downcase %>
      And I follow "<%= back_to_all %>"
      Then I should be on the <%= plural.humanize.downcase %> page