Feature: user views stock index
  In order to view the stock index
  As a user of the dividend reporter application
  I would like to be able to see a list of stocks on the landing page

  Scenario: user sees stock index page
    Given I am logged in
    Given there is a stock with company name: "Citigroup Inc."
    When I am on the stocks view page
    Then I should view "Citigroup Inc." 
