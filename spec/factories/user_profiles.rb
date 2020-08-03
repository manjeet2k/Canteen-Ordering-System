FactoryBot.define do
  factory :user_profile, class: UserProfile do
    name { "User Name" }
    phone { "9865215432" }
    user_id { 1 }
    user { create(:user) }
  end
end