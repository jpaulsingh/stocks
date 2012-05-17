@user = User.create(email: "testuser@example.com", password: "testpassword", password_confirmation: "testpassword")
@user.admin = false
@user.save
visit '/users/sign_in'
fill_in("Email", :with => "testuser@example.com")
fill_in("Password", :with => "testpassword")
click_button('Sign in')
assert page.has_content?('Signed in successfully')


