Feature: Admin removes a stock
In order to have a stock not show on the master list
As an administrator of the dividend reporter
I would like to be able to remove a stock from the master list

Scenario: Admin removes a stock from the masterlist
Given there is a stock with company name: "Google, Inc."
When I follow the stock "Google, Inc."
Then I should see "Stock successfully removed"
