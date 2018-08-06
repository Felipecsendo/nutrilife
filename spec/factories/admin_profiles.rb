FactoryBot.define do
  factory :admin_profile do
    name {Faker::Name.unique.name}
    description LeroleroGenerator.sentence(1)
    admin_id 1
 
    avatar = Rails.root.join('spec',
                            'resources',
                            'images',
                            'other',
                            'nutriguy.jpg')
  
    before(:create) do |profile|
      profile.avatar.attach(io: File.open(avatar),
                            filename: File.basename(avatar),
                            content_type: 'image/jpeg')
    end
  end
end
 
 
 