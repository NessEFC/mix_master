require 'rails_helper'

RSpec.feature "User edits an individual artist's information" do
  scenario "they see the artist's updated information" do
    artist_1 = Artist.create(name: "Rdiohead", image_path: "https://consequenceofsound.files.wordpress.com/2016/02/radiohead.jpg?quality=80&w=807")
    updated_name = "Radiohead"

    visit artist_path(artist_1)
    click_on "Edit"

    fill_in "artist_name", with: updated_name
    click_on "Update Artist"

    expect(page).to have_content(updated_name)
    expect(page).to_not have_content(artist_1.name)
    expect(page).to have_css("img[src=\"#{artist_1.image_path}\"]")
  end
end
