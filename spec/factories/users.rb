FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name        {'中川'}   
    last_name         {'涼太'}  
    first_name_kana   {'ナカガワ'}  
    last_name_kana    {'リョウタ'}  
    birthday {Faker::Date.birthday(min_age: 18, max_age: 65)}
    
    
  end
end
