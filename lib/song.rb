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
    song = self.new 
    @@all << song
    song 
  end 
  
  def self.new_by_name (name)
    song = self.new
    song.name = name
    song
  end 
  
  def self.create_by_name(name)
    song = self.create  
    song.name= name 
    song
  end 
  
  def self.find_by_name(name)
    match = self.all.find { |song| song.name == name}
    match 
  end
    
  def self.find_or_create_by_name(name)
    match = self.find_by_name(name) 
    if match 
      match 
    else 
      self.create_by_name(name)
    end 
  end 

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end 
  
  def self.new_from_filename(filename)
    song_array = filename.split("-") 
    song_array[1]= song.array[1].comp(".mp3")
    song=self.new 
    song.name= song-array[1]
    song.artist_name = song_array[0]
    song
  end
  
end
