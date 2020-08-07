FactoryBot.define do
  factory :employee_profile, class: EmployeeProfile do
    name { "User Name" }
    phone { "9865215432" }
    user_id { 1 }
    company_id { 1 }
    user { create(:employee) }
    company { create(:company) }
  end
end