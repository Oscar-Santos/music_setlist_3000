# As a user
# when i visit an artists Songs index
#   then i see the titles all of that artists Songs
#   and I see that each title is a link to the songs show page
#

require 'rails_helper'

RSpec.describe 'Artists song Index Page' do
  it 'displays titles of of the artists songs' do
    artist = Artist.create(name: 'Carly rae')
    song = artist.songs.create(title: 'I like you', length: 37283, play_count: 37483)
    song_2 = artist.songs.create(title: 'Isla green', length: 83747, play_count: 29487)

    visit "/artists/#{artist.id}/songs"

    expect(page).to have_content(song.title)
    expect(page).to have_content(song_2.title)
  end

  it 'links to the title of the song' do
    artist = Artist.create(name: 'Carly rae')
    song = artist.songs.create(title: 'I like you', length: 37283, play_count: 37483)
    song_2 = artist.songs.create(title: 'Isla green', length: 83747, play_count: 29487)

    visit "/artists/#{artist.id}/songs"

    click_link(song.title)

    expect(current_path).to eq("/songs/#{song.id}")
  end

  it 'shows the average song length for the artist' do
    artist = Artist.create(name: 'Carly rae')
    song = artist.songs.create(title: 'I like you', length: 37283, play_count: 37483)
    song_2 = artist.songs.create(title: 'Isla green', length: 83747, play_count: 29487)

    visit "/artists/#{artist.id}/songs"

    expect(page).to have_content('Average Song Length of Carly rae: 60515')
  end

  it 'shows the average song playcount for the artist' do
    artist = Artist.create(name: 'Carly rae')
    song = artist.songs.create(title: 'I like you', length: 37283, play_count: 2)
    song_2 = artist.songs.create(title: 'Isla green', length: 83747, play_count: 3)

    visit "/artists/#{artist.id}/songs"

    expect(page).to have_content('Average Song Playcount of Carly rae: 2.5')
  end
end
