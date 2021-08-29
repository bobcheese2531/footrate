FactoryBot.define do
  factory :rate do
    association :user, factory: :bob
    association :game
    home_team {"Manchester City"}
    away_team {"FC Barcelona"}
    
    trait :invalid do
      home_team {nil}
    end
  end
end
