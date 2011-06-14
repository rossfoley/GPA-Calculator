# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :course do |f|
  f.user_id 1
  f.name "English"
  f.grade "B+"
  f.level "L1"
  f.credit 1.000
  f.association :user
end
