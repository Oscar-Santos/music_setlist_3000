require 'rails_helper'

RSpec.describe Artist, type: :model do
  describe 'model' do
    it {should have_many :songs}
  end

  describe 'instance methods' do
    it 'calculates the average song length of an artist' do
      artist = Artist.create(name: 'Carly rae')
      song = artist.songs.create(title: 'I like you', length: 37283, play_count: 37483)
      song_2 = artist.songs.create(title: 'Isla green', length: 83747, play_count: 29487)

      expect(artist.average_song_length).to eq(60515)
    end

    it 'calculates the average song playcount of an artist' do
      artist = Artist.create(name: 'Carly rae')
      song = artist.songs.create(title: 'I like you', length: 37283, play_count: 2)
      song_2 = artist.songs.create(title: 'Isla green', length: 83747, play_count: 3)

      expect(artist.average_song_playcount).to eq(2.5)
    end
  end
end
