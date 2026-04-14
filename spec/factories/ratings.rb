FactoryBot.define do
  factory :rating do
    score { 1 }
    comment { "MyText" }
    user_id { 1 }
    book_id { 1 }
  end
end
