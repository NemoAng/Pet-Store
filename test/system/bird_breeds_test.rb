require "application_system_test_case"

class BirdBreedsTest < ApplicationSystemTestCase
  setup do
    @bird_breed = bird_breeds(:one)
  end

  test "visiting the index" do
    visit bird_breeds_url
    assert_selector "h1", text: "Bird Breeds"
  end

  test "creating a Bird breed" do
    visit bird_breeds_url
    click_on "New Bird Breed"

    fill_in "Description", with: @bird_breed.description
    fill_in "Name", with: @bird_breed.name
    click_on "Create Bird breed"

    assert_text "Bird breed was successfully created"
    click_on "Back"
  end

  test "updating a Bird breed" do
    visit bird_breeds_url
    click_on "Edit", match: :first

    fill_in "Description", with: @bird_breed.description
    fill_in "Name", with: @bird_breed.name
    click_on "Update Bird breed"

    assert_text "Bird breed was successfully updated"
    click_on "Back"
  end

  test "destroying a Bird breed" do
    visit bird_breeds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bird breed was successfully destroyed"
  end
end
