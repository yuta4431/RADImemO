FactoryBot.define do
  factory :program do
    title {"title"}
    personality_name {"personality"}
    channel {"channel"}
    day {"月曜日"}
    start_time {"00:00"}
    end_time {"01:00"}

    association :user, factory: :user
  end
end
