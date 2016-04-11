require 'pry'
class Song
      attr_accessor :name,  :genre, :artist
    extend Concerns::Findable

  #  track song instances
  @@all = []

    def initialize(name, artist = nil, genre = nil)
      @name = name

    self.artist = artist if artist
    self.genre = genre if genre
    end

# #
# Artists have many Genres through Song. Implement a #genres method for this association.



  def genre=(set_genre)
      @genre = set_genre
    # add this instance
    @genre.add_song(self) unless @genre.songs.include?(self)
  end

  def artist=(artist)
       @artist = artist
       artist.add_song(self) unless artist.songs.include?(self)
 end
  # return song instances
  def self.all
      @@all
  end


  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end
# #binding.pry
def self.create(name, artist = nil, genre = nil)
    new(name, artist, genre).tap{|s| s.save}
  end

#   def self.create(song, artist = nil, genre = nil)
#       new_instance = Song.new(song)
#        new_instance.save
#       new_instance
#   end

  def self.find_by_name(name)
    self.all.detect {|nm| nm = name}
  end

  def self.find_or_create_by_name(name)
            # if null eelse true
        self.find_by_name(name) || self.create(name)
  end

  #class methods

#   describe 'Making Songs from filenames' do
#   describe 'Song.new_from_filename' do
#     it 'initializes a song based on the filename delimiters' do
#       song = Song.new_from_filename("Thundercat - For Love I Come - dance.mp3")

#       expect(song.name).to eq("For Love I Come")
#       expect(song.artist.name).to eq("Thundercat")
#       expect(song.genre.name).to eq("dance")
#     end

  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name, song_name, genre_name = parts.first, parts[1], parts[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre)
  end

#   def self.new_from_filename(file_name)
#     split_file = file_name.split(" - ")
#     song_artist = split_file[0]
#     song_name = split_file[1]
#     song_genre = split_file[2].gsub(".mp3", "")

#     new_artist = Artist.create(song_artist)
#     new_genre = Genre.create(song_genre)

#      self.new(song_name, song_artist,song_genre)
#   end

# def self.new_from_filename(file_name)
#     split_file = file_name.split(" - ")
#     song_artist = split_file[0]
#     song_name = split_file[1]
#     song_genre = split_file[2].gsub(".mp3", "")

#     new_artist = Artist.create(song_artist)
#     new_genre = Genre.create(song_genre)

#    Song.new(song_name, new_artist, new_genre)

#   end
# end
  def to_s
    "#{self.artist.name} - #{self.name} - #{self.genre.name}"
  end

  def self.create_from_filename(filename)
    parts = filename.split(" - ")
    artist_name, song_name, genre_name = parts.first, parts[1], parts[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.create(song_name, artist, genre)
  end
end