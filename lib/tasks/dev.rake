namespace :dev do
  desc 'Setup Development'
  task setup: :environment do
    images_path = Rails.root.join('storage')
    puts 'Executando Setup para desenvolvimento...'
    puts "Apagando Banco... #{%x(rake db:drop)}"
    puts "Apagando imagens de Active Storage... #{%x(rm -rf #{images_path})}"
    puts "Recriando Banco... #{%x(rake db:create)}"
    puts %x(rake db:migrate)
    puts %x(rake db:seed)
    puts " Recriando Banco de Testes... #{%x(bin/rails db:migrate RAILS_ENV=test)}"
    puts 'Setup completado com sucesso!'
  end
end
