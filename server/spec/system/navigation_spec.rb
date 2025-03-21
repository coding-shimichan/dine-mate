
# require 'rails_helper'

# RSpec.describe "Navigation bar", type: :system do
#   let(:admin_user) { FactoryBot.create(:admin_user) }
#   let(:first_user) { FactoryBot.create(:first_user) }

#   scenario "Log in as normal user" do
#     # Log in page
#     visit new_user_session_path
    
#     # Navigation bar
#     nav = page.find("nav")
#     expect(page.find("nav")).to have_content "Log In"
#     expect(page.find("nav")).to have_content "Sign Up"

#     # Log in
#     fill_in "user_email", with: first_user.email
#     fill_in "user_password", with: first_user.password
#     click_button "log-in"

#     # Navigation bar
#     nav = page.find("nav")
#     expect(nav).to have_css "a", text: "Search"
#     expect(nav).to have_css "a", text: "Wishlist"
#     expect(nav).to have_css "a", text: "Chats"
#     expect(nav).to have_css "a", text: "Memories"
#     expect(nav).to have_css "a", text: "Profile"
#     expect(nav).to have_css "a", text: "Logout"

#     # Search
#     click_link "Search"
#     expect(page).to have_css "h1", text: "Search"

#     # Wishlist
#     click_link "Wishlist"
#     expect(page).to have_css "h1", text: "Wishlist"

#     # Chats
#     click_link "Chats"
#     expect(page).to have_css "h1", text: "Chats"

#     # Memories
#     click_link "Memories"
#     expect(page).to have_css "h1", text: "Memories"

#     # Profile
#     click_link "Profile"
#     expect(page).to have_css "h1", text: "Show User"

#     # Log out
#     click_link "Logout"
    
#     sign_out_notice = page.find("p.notice")
#     expect(sign_out_notice).to have_content "Signed out successfully."
#   end

#   scenario "Log in as admin user" do
#     # Log in page
#     visit new_user_session_path
    
#     # Navigation bar
#     nav = page.find("nav")
#     expect(page.find("nav")).to have_content "Log In"
#     expect(page.find("nav")).to have_content "Sign Up"

#     # Log in
#     fill_in "user_email", with: admin_user.email
#     fill_in "user_password", with: admin_user.password
#     click_button "log-in"

#     # Navigation bar
#     nav = page.find("nav")
#     expect(nav).to have_css "a", id: "admin-search"
#     expect(nav).to have_css "a", id: "admin-wishlist"
#     expect(nav).to have_css "a", id: "admin-chats"
#     expect(nav).to have_css "a", id: "admin-memories"
#     expect(nav).to have_css "a", id: "admin-users"
#     expect(nav).to have_css "a", text: "Logout"

#     # Search
#     click_link "Search"
#     expect(page).to have_css "h1", text: "Search"

#     # Wishlist
#     click_link "Wishlist"
#     expect(page).to have_css "h1", text: "Wishlist"
    
#     # Chats
#     click_link "Chats"
#     expect(page).to have_css "h1", text: "Chats"

#     # Memories
#     click_link "Memories"
#     expect(page).to have_css "h1", text: "Memories"

#     # Users
#     click_link "Users"
#     expect(page).to have_css "h1", text: "Users"

#     # Log out
#     click_link "Logout"
#     expect(page).to have_content "Signed out successfully."
#   end
# end
