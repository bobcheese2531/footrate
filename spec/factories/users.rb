FactoryBot.define do
  factory :user do
    
    trait :bob do
      name {"Bob"}
      email {"bob@gmail.com"}
      password {"12345678"}
      password_confirmation {"12345678"}
      like_team {"1"}
    end
    
    trait :steve do
      name {"Steve"}
      email {"steve@gmail.com"}
      password {"22345678"}
      password_confirmation {"22345678"}
      like_team {"2"}
    end
    
  end
end
