require 'pry'
class Genre
  attr_accessor :name, :songs
    extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end


  def add_song(song_to_add)
    @songs << song_to_add
  end

  #binding.pry
  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end


  def save
    @@all << self
  end

   def self.create(genre_to_create)
        genre = Genre.new(genre_to_create)
         genre.save
          genre
    end

  def artists
    self.songs.collect{|song| song.artist}.uniq
  end

end #end class