require 'pry'
class MusicImporter
    attr_accessor :path

  @@all =[]
  def initialize(path)
    @path = path
    @@all << self

  end


  def files
    # rreturn array forr each files that ends witj .mp3
    Dir.entries(path).select {|file| file.end_with?(".mp3")}
  end

  def import
          files.each do |file|
            Song.create_from_filename(file)
          end
   end

 # binding.pry

 # In your MusicImporter class, add an .import method that imports all the files from the library and creates the Song objects.

#   describe "MusicImporter#import" do
#   it 'imports the files into the library by creating songs from a filename' do
#     test_music_path = "./spec/fixtures/mp3s"
#     music_importer = MusicImporter.new(test_music_path)
#     music_importer.import

#     expect(Song.all.size).to eq(4)
#     expect(Artist.all.size).to eq(3)
#     expect(Genre.all.size).to eq(4)

#     expect(Song.find_by_name("Green Aisles").artist.name).to eq("Real Estate")
#     expect(Song.find_by_name("Green Aisles").artist.songs.size).to eq(2)
#   end


#     test_music_path = "./spec/fixtures/mp3s"
#        music_importer = MusicImporter.new(test_music_path)
 end # /ennd class