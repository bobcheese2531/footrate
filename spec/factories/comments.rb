FactoryBot.define do
  factory :comment do
    association :user, factory: :bob
    association :game
    content { "MyString" }
  end
end
