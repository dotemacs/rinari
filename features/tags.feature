Feature: Tags
  In order to use Ctags
  As an Emacs user
  I want the TAGS file location to change automatically

  Scenario: Should set TAGS location when visit file in project
    Given I load the following:
    """
    (setq tags-file-name "previous/TAGS/location")
    (add-hook 'rinari-minor-mode-hook
          (lambda()
             (setq rinari-tags-file-name "TAGS")))
    """
    Given Rails application "app"
    When I create a TAGS file
    And I visit "config/environment.rb"
    Then TAGS should be set to "/app/TAGS$"
