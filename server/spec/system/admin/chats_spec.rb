require 'rails_helper'

RSpec.describe "Chat management for admin users", type: :system do
  let!(:admin_user) { FactoryBot.create(:admin_user) }
  let!(:first_user) { FactoryBot.create(:first_user) }
  let!(:second_user) { FactoryBot.create(:second_user) }
  let!(:third_user) { FactoryBot.create(:third_user) }
  let!(:first_chat) { FactoryBot.create(:chat) }
  let!(:second_chat) { FactoryBot.create(:chat) }
  let!(:first_chat_user1) { FactoryBot.create(:chat_user, user_id: first_user.id, chat_id: first_chat.id) }
  let!(:first_chat_user2) { FactoryBot.create(:chat_user, user_id: second_user.id, chat_id: first_chat.id) }
  let!(:second_chat_user1) { FactoryBot.create(:chat_user, user_id: first_user.id, chat_id: second_chat.id) }
  let!(:second_chat_user2) { FactoryBot.create(:chat_user, user_id: third_user.id, chat_id: second_chat.id) }

  scenario "Admin user can list chats, show and delete a chat" do
    # Log in page
    visit new_user_session_path

    # Log in with admin credentials
    fill_in "user_email", with: admin_user.email
    fill_in "user_password", with: admin_user.password
    click_button "Log in"

    # Redirected to users page
    expect(page).to have_css "h1", text: "Users"

    # Go to chats page
    visit admin_chats_path

    # All chats are visible
    chats_table = page.find("table")
    chat_rows = chats_table.all(".chat-row")
    expect(chat_rows[0]).to have_css "tr.chat-row td", text: first_chat.id
    expect(chat_rows[1]).to have_css "tr.chat-row td", text: second_chat.id

    # Delete a chat
    within chat_rows[0] do
      click_link "Delete"
    end

    # Notification appears and chat does not exist
    expect(page).to have_content "Chat was successfully deleted."
    expect(chats_table.first(".chat-row")).not_to have_css "td", text: first_chat.id

    # Go to chat page
    last_chat_row = page.all(".chat-row").last
    within last_chat_row do
      click_link "Show"
    end

    # Chat page
    messages_div = page.find("#messages")
    expect(page).to have_css "a", text: "Back to Chats"

    # Go back to chats
    click_link "Back to Chats"
    
    # Chats page
    chats_table = page.find("table")
    chat_rows = chats_table.all(".chat-row")
    expect(chat_rows.length).to eq 1
    expect(chat_rows[0]).to have_css "tr.chat-row td", text: second_chat.id
  end
end
