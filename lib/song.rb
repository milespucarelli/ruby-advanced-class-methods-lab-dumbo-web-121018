class Song
  attr_accessor :name, :artist_name
  @@all = []
  def initialize(name = "", artist_name = "")
    @name = name
    @artist_name = artist_name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = Song.new()
    self.all << new_song
    new_song
  end

  def self.new_by_name(song_name)
    Song.new(song_name)
  end

  def self.create_by_name(song_name)
    new_song = Song.new_by_name(song_name)
    self.all << new_song
    new_song
  end

  def self.find_by_name(song_name)
    self.all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    find_result = self.find_by_name(song_name)
    if find_result == nil
      return self.create_by_name(song_name)
    else
      return find_result
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name }
  end

  def self.new_from_filename(file_name)
    file_name = file_name.split(".")[0].split(" - ")
    new_song = Song.new(file_name[1], file_name[0])
    new_song
  end

  def self.create_from_filename(file_name)
    new_song = self.new_from_filename(file_name)
    self.all << new_song
    new_song
  end

  def self.destroy_all
    self.all.clear
  end
end
