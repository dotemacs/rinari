Feature: Rinari
  In order to develop Ruby on Rails app
  As an Emacs user
  I need Rinari

  Background:
    Given rails application "app"

  Scenario: Should activate Rinari
    Given Rinari is inactive
    When I visit "config/environment.rb"
    Then Rinari should be active
