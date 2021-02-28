FactoryBot.define do
  factory :post do
    title {Faker::Lorem.sentence}
    content{Faker::Lorem.sentence}
    association :user #postするにはuserが必要、紐付けが必要なため、associationを設定。

    after(:build) do |post|
      post.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end