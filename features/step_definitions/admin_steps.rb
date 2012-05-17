Given /^I am logged in as an administrator$/ do
  @user = User.create(email: "admin@example.com", password: "password", password_confirmation: "password")
  @user.save
  @user.admin = true
  visit '/users/sign_in'
  fill_in("Email", :with => "admin@example.com")
  fill_in("Password", :with => "password")
  click_button('Sign in')
  assert page.has_content?('Signed in successfully')
end

Given /^I am on the stocks page$/ do
  visit(new_stock_path)
  current_path == (new_stock_path)
end

When /^I fill in "(.*?)" with "(.*?)"$/ do |symbol,name|


fill_in("Stock symbol", :with => symbol)
click_button('Add stock')
visit (stocks_path)
assert page.has_content(name)
#  fill_in("Stock name" , :with => name)
end

  # When /^I press "(.*?)"$/ do |button|
 #@user.admin = true                                                                                                    
# current_path == admin_panel_path 
 #choose_button(button)
#end

#Then /^I should see "(.*?)"$/ do |message|
 # rem_message = message
#end

