Feature: User watches a stock                                                                                                    
  2   In order to save a stock to my watchlist
  3   As a user of the dividend reporter
  4   I would like to choose to watch a stock from the master list
  5 
  6   Scenario: User adds a stock to his/her watchlist
  7     Given I am logged in
  8     Given a stock with company name: "Google, Inc."
  9     When I am on the stocks index page and I press Watch and then go to My list
 12     Then I should see stock added information "Google, Inc."

