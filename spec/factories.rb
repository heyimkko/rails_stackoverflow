FactoryGirl.define do
  factory :user do
    name "Kevin"
    email "kevin@kevin.com" 
    password "foobar"
  end

  factory :question do
    title "how do I use rails"
    content "a question"
    user
  end
end
