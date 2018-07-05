# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts 'Cadastrando ADMINISTRADOR Principal...'
admin = Admin.create!(email: 'admin@admin.com',
              password: '123456',
              password_confirmation: '123456',
              role: 0
              )
puts 'Cadastrando PERFIL DE ADMINISTRADOR Principal...'
 AdminProfile.create!(name: Faker::Name.name,
                      description: LeroleroGenerator.sentence(1),
                      admin: admin,
                      avatar: Rails.root.join('public',
                                        'templates',
                                        'yummy',
                                        'img',
                                        'blog-img',
                                        "#{Random.rand(17..19)}.jpg")
                                        .open,
                      )
puts 'ADMINISTRADOR Cadastrado com sucesso!'

puts 'Cadastrando OUTROS ADMINISTRADORES...'
10.times do
  
  admin = Admin.create!(email: Faker::Internet.email,
                password: '123456',
                password_confirmation: '123456',
                role: 1
                )
  puts 'Cadastrando PERFIL DE OUTROS ADMINISTRADORES...'
   AdminProfile.create!(name: Faker::Name.name,
                        description: LeroleroGenerator.sentence(1),
                        admin: admin,
                        avatar: Rails.root.join('public',
                                          'templates',
                                          'yummy',
                                          'img',
                                          'blog-img',
                                          "#{Random.rand(17..19)}.jpg")
                                          .open,
                        )
end
puts 'OUTROS ADMINISTRADORES Cadastrados com sucesso!'

puts 'Cadastrando CATEGORIAS...'
3.times do |i|
  Category.create!(description: Faker::Commerce.department(2, true),
                   avatar: Rails.root.join('public',
                                           'templates',
                                           'yummy',
                                           'img',
                                           'catagory-img',
                                           "#{i+1}.jpg")
                                           .open
                  )
end
puts 'CATEGORIAS Cadastradas com sucesso!'
  
puts 'Cadastrando BLOGS...'
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
puts 'BLOGS Cadastrados com sucesso!'
