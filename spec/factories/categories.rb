FactoryBot.define do
  factory :category do
    description {Faker::Lorem.word}
    avatar Rails.root.join('public', 'templates', 'yummy', 'img', 'catagory-img', "Category-img.jpg").open
  end
end
