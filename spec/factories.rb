FactoryGirl.define do
  factory :user do
    name "Kevin"
    email "kevin@kevin.com"
    password "kevin1"
  end

  factory :question do
    title "how do I use rails"
    content "a question"
    user
  end

  factory :answer do
    content "Bro you gotta rails new [name]"
    user
    question
  end
end
