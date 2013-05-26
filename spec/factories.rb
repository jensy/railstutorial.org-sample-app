FactoryGirl.define do
  factory :user do
    name     "Jens Nikolaus"
    email    "jensnikolaus@gmail.com"
    password "foobar"
    password_confirmation "foobar"
  end
end