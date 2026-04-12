FactoryBot.define do
  factory :community do
    sequence(:name) { |n| "Community #{n}" }
    description { 'This is a test community' }
    is_public { true }
    active { true }
    association :owner, factory: :user
  end
end
