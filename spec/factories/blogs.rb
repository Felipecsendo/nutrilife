FactoryBot.define do
  factory :blog do
    title {Faker::Dessert.variety}
    body {LeroleroGenerator.sentence(3)}
    admin Admin.first
  end
end
