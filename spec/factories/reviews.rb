FactoryBot.define do
  factory :review do
    feedback { "MyString" }
    rating { 1 }
    user { nil }
    cart { nil }
  end
end
