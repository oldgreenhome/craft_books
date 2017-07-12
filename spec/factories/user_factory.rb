FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@art.com"}
    password "vangogh"
    first_name "Vincent"
    last_name "VanGogh"
    admin false
  end

  factory :admin, class: User do
    sequence(:email) { |n| "user#{n}@art.com"}
    password "vangogh"
    first_name "Admin"
    last_name "Istrator"
    admin true
  end
end