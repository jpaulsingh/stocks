Feature: Admin adds a stock
  In order to add a stock to the master list
  As an administrator of the dividend reporter
  I would like to be able to add a stock symbol

  Scenario: Admin adds a stock to masterlist
    Given I am logged in as an administrator
    Given I am on the stocks page
    When I fill in "Add stock" with "GOOG"
    And I press "Add stock"
    Then I should see "Google Inc."
