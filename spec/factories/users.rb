FactoryBot.define do
  
  factory :user do
    name {"user"}
    email {"user@gmail.com"}
    password {"12345678"}
    password_confirmation {"12345678"}
    like_team {"0"}

    trait :invalid do
      name {nil}
    end
  end

  factory :bob, class: User do
    name {"Bob"}
    email {"bob@gmail.com"}
    password {"12345678"}
    password_confirmation {"12345678"}
    like_team {"1"}
  end
  
  factory :steve, class: User do
    name {"Steve"}
    email {"steve@gmail.com"}
    password {"12345678"}
    password_confirmation {"12345678"}
    like_team {"2"}
  end
  
end
