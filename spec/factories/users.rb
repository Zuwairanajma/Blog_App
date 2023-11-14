# spec/factories/users.rb

FactoryBot.define do
  factory :user do
    name { 'Juwairiyya' }
    photo_link { 'photo_url' }
    bio { 'Undisputed Queen of DIY' }
    posts_counter { 0 }
  end
end
