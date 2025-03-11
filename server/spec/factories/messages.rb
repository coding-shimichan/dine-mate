FactoryBot.define do
  factory :message do
    user_id { 1 }
    chat_id { 1 }
    content { "Test message" }
    is_read { false }
  end
end
