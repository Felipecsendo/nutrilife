FactoryBot.define do
  factory :admin do
  email {Faker::Internet.email}
  password '123456'
  password_confirmation '123456'
  name {Faker::Name.name}
  avatar Rails.root.join('public', "Nutritionist.jpg").open
  end
end
