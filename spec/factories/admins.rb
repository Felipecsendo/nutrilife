FactoryBot.define do
  factory :admin do
  email {Faker::Internet.email}
  password '123456'
  password_confirmation '123456'
  role Random.rand(0..1)
  end
end
