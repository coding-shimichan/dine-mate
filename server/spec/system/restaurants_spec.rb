# require 'rails_helper'

# RSpec.describe "Restaurants", type: :system do
#   let(:first_user) { FactoryBot.create(:first_user) }

#   scenario "Search restaurants", js: true do
#     # Sign in the user
#     visit new_user_session_path
#     fill_in "user_email", with: first_user.email
#     fill_in "user_password", with: "password"
#     click_button "log-in"

#     expect(page).to have_css "h1", text: "Search"

#     # Search
#     fill_in "search-field", with: "サイゼリヤ 兵庫"
#     click_button "Search"

#     # Results will be displayed
#     expect(page).to have_css "div.card"
#   end
# end
