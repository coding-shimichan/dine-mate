# require 'rails_helper'

# RSpec.describe "Wishlist management for admin users", type: :system do
#   let!(:admin_user) { FactoryBot.create(:admin_user) }
#   let!(:first_user) { FactoryBot.create(:first_user) }
#   let!(:second_user) { FactoryBot.create(:second_user) }
#   let!(:restaurant) { FactoryBot.create(:restaurant) }
#   let!(:first_wishlist) { FactoryBot.create(:wishlist, user_id: first_user.id, restaurant_id: restaurant.id) }
#   let!(:second_wishlist) { FactoryBot.create(:wishlist, user_id: second_user.id, restaurant_id: restaurant.id) }

#   scenario "Admin user can list wishlists and delete a wishlist" do
#     # Log in page
#     visit new_user_session_path

#     # Log in with admin credentials
#     fill_in "user_email", with: admin_user.email
#     fill_in "user_password", with: admin_user.password
#     click_button "Log in"

#     # Redirected to users page
#     expect(page).to have_css "h1", text: "Users"

#     # Go to wishlists page
#     visit admin_wishlists_path

#     # All wishlists are visible
#     wishlists_table = page.find("table")
#     wishlist_rows = wishlists_table.all(".wishlist-row")
#     expect(wishlist_rows[0]).to have_css "td", text: first_wishlist.id
#     expect(wishlist_rows[1]).to have_css "tr.wishlist-row td", text: second_wishlist.id

#     # Delete a wishlist
#     within wishlist_rows[0] do
#       click_link "Delete"
#     end

#     # Notification appears and wishlist does not exist
#     deletion_notice = page.find("p.notice")
#     expect(deletion_notice).to have_content "Wishlist was successfully deleted."
#     expect(wishlists_table.first(".wishlist-row")).not_to have_css "td", text: first_wishlist.id
#   end
# end
