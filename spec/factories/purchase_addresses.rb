FactoryBot.define do
  factory :purchase_address do
    post_code      { '123-4567' }
    prefecture_id  { 1 }
    city           { '東京都' }
    house_number   { '1-1' }
    number         { '08085926592' }
    token          {"tok_abcdefghijk00000000000000000"}

  end
end
