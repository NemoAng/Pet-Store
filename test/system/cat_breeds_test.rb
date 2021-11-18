require "application_system_test_case"

class CatBreedsTest < ApplicationSystemTestCase
  setup do
    @cat_breed = cat_breeds(:one)
  end

  test "visiting the index" do
    visit cat_breeds_url
    assert_selector "h1", text: "Cat Breeds"
  end

  test "creating a Cat breed" do
    visit cat_breeds_url
    click_on "New Cat Breed"

    fill_in "Description", with: @cat_breed.description
    fill_in "Name", with: @cat_breed.name
    click_on "Create Cat breed"

    assert_text "Cat breed was successfully created"
    click_on "Back"
  end

  test "updating a Cat breed" do
    visit cat_breeds_url
    click_on "Edit", match: :first

    fill_in "Description", with: @cat_breed.description
    fill_in "Name", with: @cat_breed.name
    click_on "Update Cat breed"

    assert_text "Cat breed was successfully updated"
    click_on "Back"
  end

  test "destroying a Cat breed" do
    visit cat_breeds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cat breed was successfully destroyed"
  end
end
