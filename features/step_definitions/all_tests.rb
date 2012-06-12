Given /^I am logged in as an administrator$/ do                                                                                  
   @user = User.create(email: "admin@example.com", password: "password", password_confirmation: "password")
   @user.admin = true
   @user.save
   visit '/users/sign_in'
   fill_in("Email", :with => "admin@example.com")
   fill_in("Password", :with => "password")
   click_button('Sign in')
   assert page.has_content?('Signed in successfully')
end


Given /^I am on the stocks page$/ do
  visit(stocks_path)
  current_path == (stocks_path)
end


When /^I fill in the required information and press Add stock$/ do
  click_on('New Stock')
  fill_in("Stock symbol", :with => "GOOG")
  click_on('Add stock')
end


Then /^I will see "(.*?)"$/ do |message|
  page.should have_content(message)
end


Given /^there is a stock with company_name: "(.*?)"$/ do |stock_name|
  @user = User.create(email: "admin@example.com", password: "password", password_confirmation: "password")
  @user.admin = true                                                                                                          
  @user.save
  visit '/users/sign_in'
  fill_in("Email", :with => "admin@example.com")
  fill_in("Password", :with => "password")
  click_button('Sign in')
  click_on 'Admin Panel'
  stock =  Stock.find_by_stock_name(stock_name)
end

When /^I follow the stock "(.*?)"$/ do |stock_name|
  visit stocks_path
  stock =  Stock.find_by_stock_name(stock_name)
  click_on 'remove'
end

Then /^I should see "(.*?)"$/ do |successfully_deleted_message|
  page.shouls have_content(successfully_deleted_message)
end

#admin update

Given /^I am on the admin stocks page$/ do 
  @user = User.create(email: "admin@example.com", password: "password", password_confirmation: "password")
  @user.admin = true                                                                                                             
  @user.save
  visit '/users/sign_in'
  fill_in("Email", :with => "admin@example.com")
  fill_in("Password", :with => "password")
  click_button('Sign in')
  click_on 'Admin Panel'

end

When /^I press Update all quotes$/ do
 current_path == stocks_path 
 click_link('Update all quotes')
end

 Then /^I should see update message "(.*?)"$/ do |successfullyupdated|
   current_path == stocks_path
   page.has_content?(successfullyupdated)
end 


Given /^I am logged in$/ do                                                                                             
  @user = User.create(email: "test@user.com", password: "userpassword", password_confirmation: "userpassword")
  @user.admin = false
  @user.save
  visit '/users/sign_in'
  fill_in("Email", :with => "test@user.com")
  fill_in("Password", :with => "userpassword")
  click_button('Sign in')
  assert page.has_content?("test@user.com")
  assert page.has_content?("Logout")
end

# index feature

Given /^there is a stock with company name: "(.*?)"$/ do |stock_name|
  visit stocks_path
  page.has_content?(stock_name)
end

 When /^I am on the stocks view page$/ do
  current_path == stocks_path 
end

Then /^I should view "(.*?)"$/ do |stock_name|
  visit stocks_path
  page.has_content?(stock_name)
end 


#watc stock

Given /^a stock with company name: "(.*?)"$/ do |name_of_stock|
  visit stocks_path
  stock =  Stock.find_by_stock_name(name_of_stock)                                                                              
end

When /^I am on the stocks index page and I press Watch and then go to My list$/ do
  visit stocks_path
  current_path == stocks_path
  click_on('Watch')
  visit userstocks_path 
end


Then /^I should see stock added information "(.*?)"$/ do |stock_name|
  page.has_selector(stock_name)
end 

# user specific stock

Given /^I am on list of stocks$/ do
  visit stocks_path
  current_path == stocks_path
end

When /^I follow "(.*?)"$/ do |stval|
  visit stocks_path 
  stock = Stock.find_by_stock_name(stval)
  visit stocks_path(stock)
end

Then /^I must see "(.*?)"$/ do |stock_info|
  page.has_content?(stock_info)
end



