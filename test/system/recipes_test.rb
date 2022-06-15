require "application_system_test_case"

class RecipesTest < ApplicationSystemTestCase
  setup do
    @recipe = recipes(:one)
  end

  test "visiting the index" do
    visit recipes_url
    assert_selector "h1", text: "Recipes"
  end

  test "creating a Recipe" do
    visit recipes_url
    click_on "New Recipe"

    fill_in "Food", with: @recipe.food_id
    fill_in "Recipe content", with: @recipe.recipe_content
    fill_in "Recipe image", with: @recipe.recipe_image
    fill_in "Recipe name", with: @recipe.recipe_name
    click_on "Create Recipe"

    assert_text "Recipe was successfully created"
    click_on "Back"
  end

  test "updating a Recipe" do
    visit recipes_url
    click_on "Edit", match: :first

    fill_in "Food", with: @recipe.food_id
    fill_in "Recipe content", with: @recipe.recipe_content
    fill_in "Recipe image", with: @recipe.recipe_image
    fill_in "Recipe name", with: @recipe.recipe_name
    click_on "Update Recipe"

    assert_text "Recipe was successfully updated"
    click_on "Back"
  end

  test "destroying a Recipe" do
    visit recipes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Recipe was successfully destroyed"
  end
end