
FactoryGirl.define do
  factory :center, :class => Refinery::Centers::Center do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

