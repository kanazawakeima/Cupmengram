FactoryBot.define do
  factory :food do
    name {'test_ra-men'}
    image {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test_ra-men.jpeg'))}
    content {'test'}
    company {'test'}
    price {'100'}
    taste {'しょうゆ'}
    genre {'あっさり'}
  end

  factory :second_food, class: Food do
    name {'test2_ra-men'}
    image {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test2_ra-men.jpeg'))}
    content {'test2'}
    company {'test2'}
    price {'200'}
    taste {'しお'}
    genre {'コッテリ'}
  end
end
