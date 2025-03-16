FactoryBot.define do
  factory :user do
    name {"user"}
    password {"password"}
    password_confirmation { "password" }
  end
end
