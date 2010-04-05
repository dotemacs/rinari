Feature: Rinari
  In order to develop Ruby on Rails
  As an Emacs user
  I need Rinari

  Scenario: Should activate Rinari when visiting Rails file
    Given Rails application "app"
    And Rinari is inactive
    When I visit "config/environment.rb"
    Then Rinari should be active
