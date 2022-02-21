FactoryGirl.define do
  factory :user do
    first_name 'Jon'
    last_name 'Snow'
    email 'test@test.com'
    password '123123'
    password_confirmation '123123'
  end

  factory :admin_user, class: "AdminUser" do
    first_name 'Admin'
    last_name 'User'
    email 'admin@test.com'
    password '123123'
    password_confirmation '123123'
  end








end
