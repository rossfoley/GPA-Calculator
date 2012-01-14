FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@email.com" }
    password "password"
    password_confirmation {|u| u.password }
    role "member"
  end
end
