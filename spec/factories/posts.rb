FactoryBot.define do
  factory :post do
    title { "MyString" }
    content { "MyText" }
    embed_youtube { "MyString" }
    image { "MyString" }
    association :user
  end
end
