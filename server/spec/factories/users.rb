FactoryBot.define do
  factory :first_user, class: User do
    email { "test.user1@sample.com" }
    password { "password" }
    password_confirmation { "password" }
  end

  factory :second_user, class: User do
    email { "test.user2@sample.com" }
    password { "password" }
    password_confirmation { "password" }
  end

  factory :third_user, class: User do
    email { "test.user3@sample.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
