require "application_system_test_case"

class CocktailsTest < ApplicationSystemTestCase
  setup do
    @cocktail = cocktails(:one)
  end

  test "visiting the index" do
    visit cocktails_url
    assert_selector "h1", text: "Cocktails"
  end

  test "creating a Cocktail" do
    visit cocktails_url
    click_on "New Cocktail"

    fill_in "Description", with: @cocktail.description
    fill_in "Directions", with: @cocktail.directions
    fill_in "Image", with: @cocktail.image
    fill_in "Title", with: @cocktail.title
    fill_in "User", with: @cocktail.user_id
    click_on "Create Cocktail"

    assert_text "Cocktail was successfully created"
    click_on "Back"
  end

  test "updating a Cocktail" do
    visit cocktails_url
    click_on "Edit", match: :first

    fill_in "Description", with: @cocktail.description
    fill_in "Directions", with: @cocktail.directions
    fill_in "Image", with: @cocktail.image
    fill_in "Title", with: @cocktail.title
    fill_in "User", with: @cocktail.user_id
    click_on "Update Cocktail"

    assert_text "Cocktail was successfully updated"
    click_on "Back"
  end

  test "destroying a Cocktail" do
    visit cocktails_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cocktail was successfully destroyed"
  end
end