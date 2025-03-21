# require 'rails_helper'

# RSpec.describe "Admin Users", type: :system do
#   let(:admin_user) { FactoryBot.create(:admin_user) }

#   scenario "User successfully logs in as admin" do
#     # Log in page
#     visit new_user_session_path

#     # Log in with admin credentials
#     fill_in "user_email", with: admin_user.email
#     fill_in "user_password", with: admin_user.password
#     click_button "Log in"

#     # Redirected to users page
#     expect(page).to have_css "h1", text: "Users"

#     # Log out
#     click_link "Logout"

#     # Confirm log out
#     expect(page.find("nav")).to have_content "Log In"
#     expect(page.find("nav")).to have_content "Sign Up"
#     expect(page).to have_content "Signed out successfully."
#   end

#   scenario "Admin user can create, raed, update and delete user" do
#     # Log in page
#     visit new_user_session_path

#     # Log in with admin credentials
#     fill_in "user_email", with: admin_user.email
#     fill_in "user_password", with: admin_user.password
#     click_button "Log in"

#     # Redirected to users page
#     expect(page).to have_css "h1", text: "Users"

#     # Go to profile page of other user
#     visit new_admin_user_path

#     # Create user
#     fill_in "user_email", with: "new.user@aaa.com"
#     fill_in "user_password", with: "password"
#     fill_in "user_password_confirmation", with: "password"
#     click_button "Create User"

#     # Redirected to user page
#     expect(page).to have_css "h1", text: "Show User"

#     # Go to edit user page
#     click_link "Edit this user"
#     expect(page).to have_css "h1", text: "Editing user"

#     # Update user
#     fill_in "user_email", with: "new.email@bbb.com"
#     fill_in "user_password", with: "password"
#     fill_in "user_password_confirmation", with: "password"
#     click_button "Update User"

#     # Redirected to user page
#     expect(page).to have_css "h1", text: "Show User"
#     expect(page).to have_content "new.email@bbb.com"

#     # Delete user
#     click_button "Destroy this user"

#     # Notification appeara and redirected to users page
#     expect(page).to have_content "User destroyed successfully."
#     expect(page).to have_css "h1", text: "Users"
#   end
# end
