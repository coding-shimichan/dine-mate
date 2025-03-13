require 'rails_helper'

RSpec.describe "Memory management for admin users", type: :system do
  let!(:admin_user) { FactoryBot.create(:admin_user) }
  let!(:first_user) { FactoryBot.create(:first_user) }
  let!(:second_user) { FactoryBot.create(:second_user) }
  let!(:restaurant) { FactoryBot.create(:restaurant) }
  let!(:first_memory) { FactoryBot.create(:memory, user_id: first_user.id, restaurant_id: restaurant.id, title: "First Memory", content: "First memory content") }
  let!(:second_memory) { FactoryBot.create(:memory, user_id: second_user.id, restaurant_id: restaurant.id, title: "Second Memory", content: "Second memory content") }

  scenario "Admin user can list memories, show and delete a memory" do
    # Log in page
    visit new_user_session_path

    # Log in with admin credentials
    fill_in "user_email", with: admin_user.email
    fill_in "user_password", with: admin_user.password
    click_button "Log in"

    # Redirected to users page
    expect(page).to have_css "h1", text: "Users"

    # Go to memories page
    visit admin_memories_path

    # All memories are visible
    memories_table = page.find("table")
    memory_rows = memories_table.all(".memory-row")
    expect(memory_rows[0]).to have_css "td", text: first_memory.id
    expect(memory_rows[1]).to have_css "tr.memory-row td", text: second_memory.id

    # Delete a memory
    within memory_rows[0] do
      click_link "Delete"
    end

    # Notification appears and memory does not exist
    expect(page).to have_content "Memory was successfully deleted."
    expect(memories_table.first(".memory-row")).not_to have_css "td", text: first_memory.id

    # Go to memory page
    last_memory_row = page.all(".memory-row").last
    within last_memory_row do
      click_link "Show"
    end

    # Memory page
    memory_div = page.find("div.memory")
    expect(memory_div).to have_content second_memory.title
    expect(page).to have_css "a", text: "Back to memories"
    expect(page).to have_css "button", text: "Destroy this memory"

    # Go back to memories
    click_link "Back to memories"
    
    # Memories page
    changed_memories_table = page.find("table")
    changed_memory_rows = memories_table.all(".memory-row")
    expect(changed_memory_rows.length).to eq 1
    expect(changed_memory_rows[0]).to have_css "tr.memory-row td", text: second_memory.id

    # Go to memory page again
    last_memory_row = page.all(".memory-row").last
    within last_memory_row do
      click_link "Show"
    end

    # Memory page
    memory_div = page.find("div.memory")

    # Destroy memory
    click_button "Destroy this memory"

    # Redirected to memories page
    memories_table = page.find("table")
    memory_rows = memories_table.all(".memory-row")
    expect(memory_rows.length).to eq 0
    expect(page).to have_content "Memory was successfully deleted."
  end
end
