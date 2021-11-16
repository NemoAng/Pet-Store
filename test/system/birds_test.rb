require "application_system_test_case"

class BirdsTest < ApplicationSystemTestCase
  setup do
    @bird = birds(:one)
  end

  test "visiting the index" do
    visit birds_url
    assert_selector "h1", text: "Birds"
  end

  test "creating a Bird" do
    visit birds_url
    click_on "New Bird"

    fill_in "Age", with: @bird.age
    fill_in "Description", with: @bird.description
    fill_in "Name", with: @bird.name
    fill_in "Price", with: @bird.price
    click_on "Create Bird"

    assert_text "Bird was successfully created"
    click_on "Back"
  end

  test "updating a Bird" do
    visit birds_url
    click_on "Edit", match: :first

    fill_in "Age", with: @bird.age
    fill_in "Description", with: @bird.description
    fill_in "Name", with: @bird.name
    fill_in "Price", with: @bird.price
    click_on "Update Bird"

    assert_text "Bird was successfully updated"
    click_on "Back"
  end

  test "destroying a Bird" do
    visit birds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bird was successfully destroyed"
  end
end
