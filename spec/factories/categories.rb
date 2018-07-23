FactoryBot.define do
  factory :category do
    description {Faker::Food.unique.spice}
    admin_id 1
    avatar Rails.root.join('public', 'templates', 'yummy', 'img', 'catagory-img', "Category-img.jpg").open
  end
end
