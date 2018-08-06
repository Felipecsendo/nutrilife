FactoryBot.define do
  factory :post do
    transient do
      cover  Rails.root.join('spec',
                             'resources',
                             'images',
                             'other',
                             'Nutritionist.jpg')
    end
    title {Faker::Dessert.variety}
    body {LeroleroGenerator.sentence(3)}
    admin_id 1
    category_id 1

    after(:build) do |post, image|
      post.cover.attach(io: File.open(image.cover),
                        filename: File.basename(image.cover),
                        content_type: 'image/jpeg')
    end
  end
end