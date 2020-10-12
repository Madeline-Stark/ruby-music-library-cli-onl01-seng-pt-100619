class Genre

attr_accessor :name
attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre

  end

  def artists
    songs.collect{ |song| song.artist }.uniq
    # has many through
  end


end 