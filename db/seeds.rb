# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(email: 'admin@admin.com', password: '123456', password_confirmation: '123456')

10.times do
  Blog.create!(title: Faker::Dessert.variety, body: LeroleroGenerator.sentence(3), admin: Admin.first)
end

3.times do
  Category.create!(description: Faker::Commerce.department(2, true))
end