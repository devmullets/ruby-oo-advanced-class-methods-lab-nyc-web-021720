require 'pry'
class Song

  attr_accessor :name, :artist_name
  @@all = []
 
  def self.all
    @@all
  end
 
  def save
    self.class.all << self
  end
 
  def self.create
    song = Song.new
    song.save
    song
  end 

  def self.new_by_name(song_name)
    song = Song.new 
    song.name = song_name
    song 
  end 

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end 

  def self.find_by_name(song_to_find)
    Song.all.find do |song| 
      if song.name == song_to_find
        return song
      end 
    end
  end 

  def self.find_or_create_by_name(song_name)
    
    if Song.find_by_name(song_name)
      return Song.find_by_name(song_name)
    else 
      Song.create_by_name(song_name)
    end 
  end 

  def self.alphabetical
    Song.all.sort_by do |songs| 
      songs.name 
    end 
  end 

  def self.new_from_filename(new_file)
    parts = new_file.split(" - ") # split string by separator (forms new array)
    artist_name = parts[0] # select 1st part of array
    song_name = parts[1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song 
  end 

  def self.create_from_filename(new_file)
    parts = new_file.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song 
  end 

  def self.destroy_all
    self.all.clear # remove all elements in array
  end 
end