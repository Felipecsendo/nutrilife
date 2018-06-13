FactoryBot.define do
  factory :admin_profile do
    name {Faker::Name.name}
    avatar Rails.root.join('public', "nutriguy.jpg").open
    description LeroleroGenerator.sentence(1)
    admin_id 1
  end
end
