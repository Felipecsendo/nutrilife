FactoryBot.define do
  factory :category do
    transient do
      cover  Rails.root.join('spec',
                             'resources',
                             'images',
                             'category',
                             "1.jpg")
    end

    description {Faker::Food.unique.spice}
    admin_id 1

    after(:build) do |category, image|
      category.cover.attach(io: File.open(image.cover),
                            filename: File.basename(image.cover),
                            content_type: 'image/jpeg')
    end
  end
end
 
