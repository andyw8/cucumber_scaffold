Feature: Run cucumber_scaffold:feature generator
  In order to quickly build Cucumber features
  a developer
  wants to run the the cucumber_scaffold:feature generator

  Background:
    Given a Rails 3 app is configured for Cucumber
    And I have successfully run the "cucumber_scaffold:install" generator
  
    @wip
    Scenario: Run generator
      When I run "rails g scaffold Post name:string body:text words:integer"
      Then the output should be:
        """
        created  features/step_definitions/post_steps.rb
        created  features/manage_posts.feature
        gsub     features/support/steps.rb
        """
      
    @wip
    Scenario: Paths file
      Pending

    @wip
    Scenario: Feature file
      Pending

    @wip
    Scenario: Support file
      Pending

    @wip
    Scenario: Run tests before modifications
      When I run "cucumber features/manage_posts.feature"
      Then the output should be
        """
        x scenarios (x failed, x passed x pending)
        """
    @wip
    Scenario: Run tests after modifications
      Given I have added the following to "features/manage_posts" after "..."
        """
        validates_presence_of :name
        validates_presence_of :body
        """
      And I add the following to "features/support/paths.rb" after "..."
        """
        when /page for the post with name "([^"]*)"$/
          post = Post.find(:first, {:conditions => {:name => $1} })
          post_path(matches.first)
        """
      And I replace...