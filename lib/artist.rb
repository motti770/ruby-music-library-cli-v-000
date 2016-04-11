require 'pry'
class Artist
  attr_accessor :name, :songs
  extend Concerns::Findable
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def genres
        self.songs.collect{|song| song.genre}.uniq
      end


  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

    def self.create(artist_to_create)
        artist = Artist.new(artist_to_create)
         artist.save
          artist
    end

    def add_song(song_to_add)
        song_to_add.artist = self unless song_to_add.artist == self
        self.songs << song_to_add unless songs.include?(song_to_add)
    end

#binding.pry
end # end class

#binding.pry