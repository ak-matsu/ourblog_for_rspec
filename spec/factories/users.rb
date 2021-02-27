FactoryBot.define do
  factory :user do
    nickname = { Faker::name.last_name }
    email = {Faker::Internet.free_mail}
    password = {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end
