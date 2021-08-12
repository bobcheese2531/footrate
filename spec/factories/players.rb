FactoryBot.define do
  
  factory :player do
    shirtnumber {"10"}
    position {"OMF"}
    name {"LEO"}
    player_rate {"10"}
    team_id {"2"}
    rate_text {"GOAT"}
    rate_id {1}
  end
  
  factory :debruyne, class: Player do
    association :rate
    shirtnumber {"17"}
    position {"CMF"}
    name {"デブライネ"}
    player_rate {"10"}
    team_id {"1"}
    rate_text {"awesome"}
  end

end
