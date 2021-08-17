FactoryBot.define do
  factory :comment do
    content { "MyString" }
    user { nil }
    game { nil }
  end
end
