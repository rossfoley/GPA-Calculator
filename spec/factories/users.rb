Factory.define :user do |f|
  f.sequence(:email) { |n| "email#{n}@email.com" }
  f.password "password"
  f.password_confirmation {|u| u.password }
  f.role "member"
end
