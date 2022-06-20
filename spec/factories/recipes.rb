FactoryBot.define do
  factory :recipe do
    recipe_name {'test_recipe'}
    recipe_image {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test_ra-men.jpeg'))}
    recipe_content {'test'}
    food {FactoryBot.create(:food)}
    user {FactoryBot.create(:user)}
  end

  factory :second_recipe, class: Recipe do
    recipe_name {'test2_ra-men'}
    recipe_image {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test2_ra-men.jpeg'))}
    recipe_content {'test2'}
    food {FactoryBot.create(:food)}
    user {FactoryBot.create(:admin_user)}
  end
end
