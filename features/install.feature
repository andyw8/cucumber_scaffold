Feature: Run cucumber_scaffold:install generator
  In order to take advantage of some useful Cucumber web steps
  a developer
  wants to run the the cucumber_scaffold:install generator

  @wip
  Scenario: Install
    Given a new Rails 3 app
    When I cd into that directory
    And I run 'rails g cucumber_scaffold:install'
    Then the output should be "created  features/step_definitions/web_steps_additional.rb"