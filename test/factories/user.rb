Factory.define :user do |f|
  f.sequence(:email) { |n| "testuser_#{n}@helpme.com" }
  f.password 'password'
  f.password_confirmation { |u| u.password }
end
