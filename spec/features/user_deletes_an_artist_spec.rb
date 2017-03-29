require 'rails_helper'

RSpec.feature "User deletes an artist's page" do
  scenario "the artist is removed from the artists index page" do
    artist_1 = Artist.create(name: "Radiohead", image_path: "https://consequenceofsound.files.wordpress.com/2016/02/radiohead.jpg?quality=80&w=807")

    visit artist_path(artist_1)
    click_on "Delete"

    expect(current_path).to eq(artists_path)
    expect(page).to_not have_content(artist_1.name)
  end
end
