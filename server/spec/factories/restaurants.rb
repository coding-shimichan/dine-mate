FactoryBot.define do
  factory :restaurant do
    internal_id { "J0001234" }
    external_id { "J0001234" }
    payload { {
      "id": "J0001234",
      "name": "First Restaurant"
    } }
  end
end
