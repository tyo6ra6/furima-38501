FactoryBot.define do
  factory :item do
    item_name         { 'テスト出品' }
    text              { 'テストの出品です' }
    price             { '1000' }
    category_id       { 5 }
    condition_id      { 2 }
    shipping_payer_id { 2 }
    area_id           { 28 }
    take_time_id      { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
