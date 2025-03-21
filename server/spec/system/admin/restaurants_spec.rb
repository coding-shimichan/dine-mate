# require 'rails_helper'

# RSpec.describe "Restaurant management for admin users", type: :system do
#   let!(:admin_user) { FactoryBot.create(:admin_user) }
#   let!(:first_restaurant) { FactoryBot.create(:restaurant)}
#   let!(:second_restaurant) { FactoryBot.create(:restaurant, internal_id: "J0002222", external_id: "J0002222", payload: { "id": "J0002222", "name": "second_restaurant"}) }

#   scenario "Admin user can list restaurants, show and delete a restaurant" do
#     # Log in page
#     visit new_user_session_path

#     # Log in with admin credentials
#     fill_in "user_email", with: admin_user.email
#     fill_in "user_password", with: admin_user.password
#     click_button "Log in"

#     # Redirected to users page
#     expect(page).to have_css "h1", text: "Users"

#     # Go to restaurants page
#     visit admin_restaurants_path

#     # All restaurants are visible
#     restaurants_table = page.find("table")
#     restaurant_rows = restaurants_table.all(".restaurant-row")
#     expect(restaurant_rows[0]).to have_css "td", text: first_restaurant.id
#     expect(restaurant_rows[1]).to have_css "tr.restaurant-row td", text: second_restaurant.id

#     # Delete a restaurant
#     within restaurant_rows[0] do
#       click_link "Delete"
#     end

#     # Notification appears and restaurant does not exist
#     deletion_notice = page.find("p.notice")
#     expect(deletion_notice).to have_content "Restaurant was successfully deleted."
#     expect(restaurants_table.first(".restaurant-row")).not_to have_css "td", text: first_restaurant.id

#     # Go to restaurant page
#     last_restaurant_row = page.all(".restaurant-row").last
#     within last_restaurant_row do
#       click_link "Show"
#     end

#     # Restaurant page
#     restaurant_div = page.find("div.restaurant")
#     expect(restaurant_div).to have_content second_restaurant.payload["name"]
#     expect(page).to have_css "a", text: "Back to restaurants"
#     expect(page).to have_css "button", text: "Destroy this restaurant"

#     # Go back to restaurants
#     click_link "Back to restaurants"
    
#     # Restaurants page
#     changed_restaurants_table = page.find("table")
#     changed_restaurant_rows = restaurants_table.all(".restaurant-row")
#     expect(changed_restaurant_rows.length).to eq 1
#     expect(changed_restaurant_rows[0]).to have_css "tr.restaurant-row td", text: second_restaurant.id

#     # Go to restaurant page again
#     last_restaurant_row = page.all(".restaurant-row").last
#     within last_restaurant_row do
#       click_link "Show"
#     end

#     # Restaurant page
#     restaurant_div = page.find("div.restaurant")

#     # Destroy restaurant
#     click_button "Destroy this restaurant"

#     # Redirected to restaurants page
#     expect(page).to have_current_path(admin_restaurants_path)
#     expect(page).to have_selector("table")
#     expect(page).not_to have_selector("tr.restaurant-row")
#     expect(page).to have_content("Restaurant was successfully deleted.")
#   end
# end
