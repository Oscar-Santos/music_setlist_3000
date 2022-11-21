require 'rails_helper'

# As a visitor
# when i visit /songs/1
#   then i see songs's title and artist
#   and i dont see any other song in my database

RSpec.describe 'Songs Show page' do
  it 'displays title of the song' do
    artist = Artist.create(name: 'Carly rae')
    song = artist.songs.create(title: 'I like you', length: 37283, play_count: 37483)
    song_2 = artist.songs.create(title: 'Isla green', length: 83747, play_count: 29487)

    visit "/songs/#{song.id}"

    expect(page).to have_content(song.title)
    expect(page).to_not have_content(song_2.title)
  end

  it 'displays artist of the song' do
    artist = Artist.create(name: 'Carly rae')
    song = artist.songs.create(title: 'I like you', length: 37283, play_count: 37483)
    song_2 = artist.songs.create(title: 'Isla green', length: 83747, play_count: 29487)

    visit "/songs/#{song.id}"

    expect(page).to have_content(artist.name)
  end


end
