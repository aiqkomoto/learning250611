FactoryBot.define do
  factory :comment do
    user { nil }
    music { nil }
    content { "MyText" }
  end
end
