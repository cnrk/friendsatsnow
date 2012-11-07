FactoryGirl.define do
  factory :participant do
    name "John"
    surname  "Doe"
    email "johndoe@example.com"
  end

  factory :invalid_participant, class: :participant do
    name ""
    surname  "Invalid"
    email "johndoe@@example.....com"
  end
end
