FactoryBot.define do
  factory :post do
    title { 'MyString' }
    content { 'MyText' }
    embed_youtube { 'MyString' }
    association :user
  end
end
