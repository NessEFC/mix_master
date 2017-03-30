require 'rails_helper'

RSpec.feature "User visits the index page and clicks on a playlist" do
  scenario "User can see the songs in the playlist" do
    playlist = create(:playlist_with_songs)

    visit playlists_path

    expect(page).to have_link playlist.name, href: playlist_path(playlist)

    click_on playlist.name

    expect(current_path).to eq(playlist_path(playlist))
  end
end
