# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(email: 'admin@admin.com',
              name: Faker::Name.name,
              password: '123456',
              password_confirmation: '123456',
              avatar: Rails.root.join('public',
                                        'templates',
                                        'yummy',
                                        'img',
                                        'blog-img',
                                        "#{Random.rand(17..19)}.jpg"))
              
3.times do |i|
  Category.create!(description: Faker::Commerce.department(2, true),
                   avatar: Rails.root.join('public',
                                           'templates',
                                           'yummy',
                                           'img',
                                           'catagory-img',
                                           "#{i+1}.jpg")
                                           .open)
end
              
10.times do
  Blog.create!(title: Faker::Dessert.variety,
               body: LeroleroGenerator.sentence(3),
               admin: Admin.first,
               category: Category.all.sample,
               images: [Rails.root.join('public',
                                        'templates',
                                        'yummy',
                                        'img',
                                        'blog-img',
                                        "#{Random.rand(1..16)}.jpg")
                                        .open]
              )
end
