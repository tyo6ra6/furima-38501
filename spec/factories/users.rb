FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name        {'first.kanji'}  
    last_name         {'last.kanji'}  
    first_name_kana   {'first.katakana'}  
    last_name_kana    {'last.katakana'}  
    birthday {Faker::Date.birthday(min_age: 18, max_age: 65)}
    
    
  end
end
