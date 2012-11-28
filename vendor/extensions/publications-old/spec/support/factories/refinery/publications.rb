
FactoryGirl.define do
  factory :publication, :class => Refinery::Publications::Publication do
    sequence(:authors) { |n| "refinery#{n}" }
  end
end

