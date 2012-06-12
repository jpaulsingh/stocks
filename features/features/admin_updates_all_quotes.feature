Feature: Admin updates all quotes
  In order to see the most current information
  As an administrator on the dividend reporter
  I would like to be able to update all quotes at one time

  Scenario: Admin update all quotes at one time
    Given I am on the admin stocks page
    When I press Update all quotes
    Then I should see update message "All stocks updated"


