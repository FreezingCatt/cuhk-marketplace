FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@link.cuhk.edu.hk" }
    password { 'password123' }
    name { 'Test User' }
    sequence(:student_id) { |n| "1155#{n.to_s.rjust(4, '0')}" }
    confirmed_at { Time.now }

    trait :unverified do
      confirmed_at { nil }
    end

    trait :admin do
      role { :admin }
    end

    trait :community_manager do
      role { :community_manager }
    end
  end
end
