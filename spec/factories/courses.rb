FactoryGirl.define do
  factory :course do
    user_id 1
    name "English"
    grade "B+"
    level "L1"
    credit 1.000
    association :user
  end
end
