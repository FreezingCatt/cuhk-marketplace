FactoryBot.define do
  factory :community_membership do
    user
    community
    role { :member }

    trait :owner do
      role { :owner }
    end

    trait :moderator do
      role { :moderator }
    end
  end
end