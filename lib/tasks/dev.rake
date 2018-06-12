namespace :dev do
  desc 'Setup Development'
  task setup: :environment do
    images_path = Rails.root.join('public', 'uploads')
    puts 'Executando Setup para desenvolvimento...'
    puts "Apagando Banco... #{%x(rake db:drop)}"
    puts "Apagando imagens de public/system... #{%x(rm -rf #{images_path})}"
    puts "Recriando Banco... #{%x(rake db:create)}"
    puts %x(rake db:migrate)
    puts %x(rake db:seed)
    puts 'Setup completado com sucesso!'
  end
end
