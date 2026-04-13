FactoryBot.define do
  factory :book do
    user { nil }
    title { "MyString" }
    author { "MyString" }
    isbn { "MyString" }
    price { "9.99" }
    condition { "MyString" }
    location { "MyString" }
    status { 1 }
  end
end
