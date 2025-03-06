FactoryBot.define do
  factory :memory do
    user_id { 1 }
    restaurant_id { "J0001234" }
    title { "First Memory" }
    content { "First memory" }
  end
end
