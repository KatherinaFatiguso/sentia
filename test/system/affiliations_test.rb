require "application_system_test_case"

class AffiliationsTest < ApplicationSystemTestCase
  setup do
    @affiliation = affiliations(:one)
  end

  test "visiting the index" do
    visit affiliations_url
    assert_selector "h1", text: "Affiliations"
  end

  test "creating a Affiliation" do
    visit affiliations_url
    click_on "New Affiliation"

    fill_in "Name", with: @affiliation.name
    click_on "Create Affiliation"

    assert_text "Affiliation was successfully created"
    click_on "Back"
  end

  test "updating a Affiliation" do
    visit affiliations_url
    click_on "Edit", match: :first

    fill_in "Name", with: @affiliation.name
    click_on "Update Affiliation"

    assert_text "Affiliation was successfully updated"
    click_on "Back"
  end

  test "destroying a Affiliation" do
    visit affiliations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Affiliation was successfully destroyed"
  end
end
