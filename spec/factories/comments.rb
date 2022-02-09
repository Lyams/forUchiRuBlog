FactoryBot.define do
  factory :comment do
    message { "MyText" }
    association :post
  end
end
