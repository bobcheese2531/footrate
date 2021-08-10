FactoryBot.define do
  factory :player do
    association :rate
    shirtnumber {"17"}
    position {"CMF"}
    name {"デブライネ"}
    player_rate {"10"}
    team_id {"1"}
    rate_text {"awesome"}
  end
end
