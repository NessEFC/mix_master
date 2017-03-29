require 'rails_helper'

RSpec.feature "User views a list of all artists" do
  scenario "they visit the artists index page" do
    artist_1 = Artist.create(name: "Radiohead", image_path: "https://consequenceofsound.files.wordpress.com/2016/02/radiohead.jpg?quality=80&w=807")
    artist_2 = Artist.create(name: "Arctic Monkeys", image_path: "https://ksassets.timeincuk.net/wp/uploads/sites/55/2013/08/2013ArcticMonkeys_Press_ZackeryMichael-240613-2.jpg")

    visit artists_path

    expect(page).to have_content(artist_1.name)
    expect(page).to have_content(artist_2.name)

    click_link(artist_1.name)

    expect(page).to have_content(artist_1.name)
    expect(page).to have_css("img[src=\"#{artist_1.image_path}\"]")

    visit artists_path
    click_link(artist_2.name)

    expect(page).to have_content(artist_2.name)
    expect(page).to have_css("img[src=\"#{artist_2.image_path}\"]")
  end
end
