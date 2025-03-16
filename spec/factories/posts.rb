FactoryBot.define do
  factory :post do
    program { FactoryBot.create(:program) }
    broadcast_date { Time.zone.now }
    content { "content" }
  end
end
