FactoryBot.define do
  factory :blog do
    title {Faker::Dessert.variety}
    body {LeroleroGenerator.sentence(3)}
    admin_id 1
    category_id 1
    images [Rails.root.join('public', "Nutritionist.jpg").open]
  end
end
