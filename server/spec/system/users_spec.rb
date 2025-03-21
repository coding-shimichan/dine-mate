# require 'rails_helper'

# RSpec.describe "Users", type: :system do
#   let(:first_user) { FactoryBot.create(:first_user) }

#   scenario "User uploads a profile photo", js: true do
#     # Sign in the user
#     visit new_user_session_path
#     fill_in "user_email", with: first_user.email
#     fill_in "user_password", with: "password"
#     click_button "log-in"

#     expect(page).to have_css "h1", text: "Search"

#     # Go to profile edit page
#     visit edit_user_registration_path
#     expect(page).to have_css "h2", text: "Edit User"

#     # Attach a profile photo
#     expect(page).to have_css "#user_profile_photo"
#     page.attach_file "user_profile_photo", "spec/fixtures/files/profile.jpg"

#     # Fill password
#     fill_in "user_current_password", with: first_user.password

#     # Save changes
#     click_button "update"

#     # expect(first_user.profile_photo).to be_attached

#     # Expect the image to be displayed
#     expect(page).to have_css "h1", text: "Show User"
#     expect(page).to have_css("img")
#   end
# end
