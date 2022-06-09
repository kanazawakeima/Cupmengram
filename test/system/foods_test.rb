require "application_system_test_case"

class FoodsTest < ApplicationSystemTestCase
  setup do
    @food = foods(:one)
  end

  test "visiting the index" do
    visit foods_url
    assert_selector "h1", text: "Foods"
  end

  test "creating a Food" do
    visit foods_url
    click_on "New Food"

    fill_in "Company", with: @food.company
    fill_in "Content", with: @food.content
    fill_in "Genre", with: @food.genre
    fill_in "Image", with: @food.image
    fill_in "Name", with: @food.name
    fill_in "Price", with: @food.price
    fill_in "Taste", with: @food.taste
    click_on "Create Food"

    assert_text "Food was successfully created"
    click_on "Back"
  end

  test "updating a Food" do
    visit foods_url
    click_on "Edit", match: :first

    fill_in "Company", with: @food.company
    fill_in "Content", with: @food.content
    fill_in "Genre", with: @food.genre
    fill_in "Image", with: @food.image
    fill_in "Name", with: @food.name
    fill_in "Price", with: @food.price
    fill_in "Taste", with: @food.taste
    click_on "Update Food"

    assert_text "Food was successfully updated"
    click_on "Back"
  end

  test "destroying a Food" do
    visit foods_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Food was successfully destroyed"
  end
end
