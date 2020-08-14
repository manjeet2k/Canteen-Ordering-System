FactoryBot.define do
  factory :user, class: User do
    email { Faker::Internet.email }
    password { "pass123" }  
  end

  factory :employee, class: User do
    email { Faker::Internet.email }
    password { "pass123" }
    role { 1 }    
  end

  factory :chef, class: User do
    email { Faker::Internet.email }
    password { "pass123" }
    role { 2 }    
  end

  factory :admin, class: User do
    email { Faker::Internet.email }
    password { "pass123" }
    admin { true }    
  end

  factory :duplicate_user, class: User do
    email { Faker::Internet.email }
    password { "pass123" }   
  end
end
