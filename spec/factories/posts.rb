FactoryBot.define do
  factory :post do
    # Define your post attributes here
    title { 'Sample Post' }
    content { 'Lorem ipsum...' }
    author
  end
end
