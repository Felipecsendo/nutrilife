# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def create_admin_profile(admin)
  profile = AdminProfile.new(name: Faker::Name.name,
                             description: LeroleroGenerator.sentence(1),
                             admin: admin)
  
  avatar = Rails.root.join('spec',
                           'resources',
                           'images',
                           'profile',
                           "#{Random.rand(1..4)}.jpg")
  profile.avatar.attach(io: File.open(avatar), filename: File.basename(avatar))
  profile.save!
end

puts 'Cadastrando ADMINISTRADOR Principal...'
admin = Admin.create!(email: 'admin@admin.com',
              password: '123456',
              password_confirmation: '123456',
              role: 0
              )
puts 'Cadastrando PERFIL DE ADMINISTRADOR Principal...'
 create_admin_profile(admin)
 puts 'PERFIL DE ADMINISTRADOR Principal cadastrado com sucesso!'
puts 'ADMINISTRADOR Cadastrado com sucesso!'

puts 'Cadastrando OUTROS ADMINISTRADORES...'
10.times do
  
  admin = Admin.create!(email: Faker::Internet.email,
                        password: '123456',
                        password_confirmation: '123456',
                        role: 1)
  create_admin_profile(admin)
end
puts 'OUTROS ADMINISTRADORES Cadastrados com sucesso!'

puts 'Cadastrando CATEGORIAS...'
3.times do |i|
  category = Category.new(description: Faker::Commerce.department(2, true),
                          admin: admin
                          )
  cover = Rails.root.join('spec',
                          'resources',
                          'images',
                          'category',
                          "#{i+1}.jpg")

  category.cover.attach(io: File.open(cover), filename: File.basename(cover))
  category.save!
end
puts 'CATEGORIAS Cadastradas com sucesso!'
  
puts 'Cadastrando BLOGS...'
10.times do
  post = Post.new(title: Faker::Dessert.variety,
                  body: LeroleroGenerator.sentence(3),
                  admin: Admin.first,
                  category: Category.all.sample)

  cover = Rails.root.join('spec',
                          'resources',
                          'images',
                          'blog',
                          "#{Random.rand(1..9)}.jpg")

  post.cover.attach(io: File.open(cover), filename: File.basename(cover))
  post.save!
end
puts 'BLOGS Cadastrados com sucesso!'
