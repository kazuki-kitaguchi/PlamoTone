require "application_system_test_case"

class MakersTest < ApplicationSystemTestCase
  setup do
    @maker = makers(:one)
  end

  test "visiting the index" do
    visit makers_url
    assert_selector "h1", text: "Makers"
  end

  test "creating a Maker" do
    visit makers_url
    click_on "New Maker"

    fill_in "Name", with: @maker.name
    click_on "Create Maker"

    assert_text "Maker was successfully created"
    click_on "Back"
  end

  test "updating a Maker" do
    visit makers_url
    click_on "Edit", match: :first

    fill_in "Name", with: @maker.name
    click_on "Update Maker"

    assert_text "Maker was successfully updated"
    click_on "Back"
  end

  test "destroying a Maker" do
    visit makers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Maker was successfully destroyed"
  end
end
