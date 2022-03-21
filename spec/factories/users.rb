FactoryGirl.define do

  # So that we hace different emails per user and we pass the validations
  sequence :email do |n|
    "test#{n}@gmail.com"
  end

  factory :user do
    first_name 'Jon'
    last_name 'Snow'
    email { generate :email }
    password '123123'
    password_confirmation '123123'
  end

  factory :admin_user, class: "AdminUser" do
    first_name 'Admin'
    last_name 'User'
    email { generate :email }
    password '123123'
    password_confirmation '123123'
  end
end
