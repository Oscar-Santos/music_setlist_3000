class Artist < ApplicationRecord
  has_many :songs

  def average_song_length
    self.songs.average(:length)
  end

  def average_song_playcount
    self.songs.average(:play_count)
  end
end
