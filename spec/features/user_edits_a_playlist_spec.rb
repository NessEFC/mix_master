require 'rails_helper'

RSpec.feature "When a user visits a playlist show page" do
  scenario "they should be able to edit the playlist information" do
    playlist = create(:playlist_with_songs)
    new_name = generate(:playlist_name)
    song_1, song_2, song_3 = playlist.songs
    new_song = create(:song, title: "Stairway to Heaven")

    visit playlist_path(playlist)
    click_on "Edit"
    fill_in "playlist_name", with: new_name
    uncheck("song-#{song_3.id}")
    check("song-#{new_song.id}")
    click_on "Update Playlist"

    expect(page).to have_content(new_name)
    expect(page).to have_content(new_song.title)
    expect(page).to_not have_content(song_3.title)
  end
end
