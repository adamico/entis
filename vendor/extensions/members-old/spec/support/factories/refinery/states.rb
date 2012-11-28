
FactoryGirl.define do
  factory :state, :class => Refinery::States::State do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

