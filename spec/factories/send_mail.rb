FactoryGirl.define do
  factory :send_mail do
    to       { Faker::Internet.email     }
    subject  { "Hello"    }
    body     { "This is body"     }
  end
end