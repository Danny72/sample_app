FactoryGirl.define do
  factory :user do
    name     "Joe Hert"
    email    "joehert@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end
