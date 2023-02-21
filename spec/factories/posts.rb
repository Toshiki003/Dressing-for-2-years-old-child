FactoryBot.define do
  factory :post do
    user { nil }
    title { "MyString" }
    content { "MyText" }
    embed_youtube { "MyString" }
    image { "MyString" }
  end
end
