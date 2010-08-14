Feature: Rinari
  In order to develop Ruby on Rails app
  As an Emacs user
  I need Rinari

  Scenario: Should activate Rinari 
    Given rails application "app"
    And Rinari is inactive
    When I visit "config/environment.rb"
    Then Rinari should be active

  Scenario: Should jump around beetween model, views & controller 
    Given I generate scaffold for "Book"
    When I visit "app/models/book.rb"
    And I press "C-c ; f c"
    Then I should be in "app/controllers/books_controller.rb"
    And I go to word "index"
    And I press "C-c ; f v"
    Then I should be in "app/views/index.html.erb"
    And I press "C-c ; f c"
    Then I should be in "app/controllers/books_controller.rb"
    And I go to word "show"
    And I press "C-c ; f v"
    Then I should be in "app/views/show.html.erb"
    And I press "C-c ; f c"
    Then I should be in "app/controllers/books_controller.rb"
    And I go to word "new"
    And I press "C-c ; f v"
    Then I should be in "app/views/new.html.erb"
    And I press "C-c ; f c"
    Then I should be in "app/controllers/books_controller.rb"
    And I go to word "edit"
    And I press "C-c ; f v"
    Then I should be in "app/views/edit.html.erb"
    And I press "C-c ; f m"
    Then I should be in "app/models/book.rb"

  Scenario: Should jump from model to views
    When I visit "app/models/book.rb"
    Given I start an action chain
    And I press "C-c ; f v"
    And I type "index.html.erb"
    And I execute the action chain
    Then I should be in "app/views/index.html.erb"
    And I press "C-c ; f m"
    When I should be in "app/models/book.rb"
    Given I start an action chain
    And I press "C-c ; f v"
    And I type "new.html.erb"
    And I execute the action chain
    Then I should be in "app/views/new.html.erb"
    And I press "C-c ; f m"
    When I should be in "app/models/book.rb"
    Given I start an action chain
    And I press "C-c ; f v"
    And I type "show.html.erb"
    And I execute the action chain
    Then I should be in "app/views/show.html.erb"
    And I press "C-c ; f m"
    When I should be in "app/models/book.rb"
    Given I start an action chain
    And I press "C-c ; f v"
    And I type "edit.html.erb"
    And I execute the action chain
    Then I should be in "app/views/edit.html.erb"
    And I press "C-c ; f m"
    Then I should be in "app/models/book.rb"

  Scenario: Should jump from controllers to helpers
    When I visit "app/controllers/application_controller.rb"
    And I press "C-c ; f h"
    Then I should be in "app/helpers/application_helper.rb"
    Given I start an action chain
    And I press "C-c ; f h"
    And I type "books_helper.rb"
    And I execute the action chain
    Then I should be in "app/helpers/books_helper.rb"
    And I press "C-c ; f h"
    Then I should be in "app/controllers/books_controller.rb"

  Scenario: Should jump to and from logs
    When I visit "app/controllers/application_controller.rb"
    Given I start an action chain
    And I press "C-c ; f o"
    And I type "development.log"
    And I execute the action chain
    Then I should be in "log/development.log"
    Given I start an action chain
    And I press "C-c ; f c"
    And I type "application_controller.rb"
    And I execute the action chain
    Then I should be in "app/controllers/application_controller.rb"
    Given I start an action chain
    And I press "C-c ; f o"
    And I type "test.log"
    And I execute the action chain
    Then I should be in "log/test.log"
    Given I start an action chain
    And I press "C-c ; f c"
    And I type "application_controller.rb"
    And I execute the action chain
    Then I should be in "app/controllers/application_controller.rb"
    Given I start an action chain
    And I press "C-c ; f o"
    And I type "production.log"
    And I execute the action chain
    Then I should be in "log/production.log"
    Given I start an action chain
    And I press "C-c ; f c"
    And I type "application_controller.rb"
    And I execute the action chain
    Then I should be in "app/controllers/application_controller.rb"
    Given I start an action chain
    And I press "C-c ; f o"
    And I type "server.log"
    And I execute the action chain
    Then I should be in "log/server.log"
