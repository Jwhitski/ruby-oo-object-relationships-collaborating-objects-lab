require 'pry'
class Artist
    attr_accessor :name, :songs

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
        @@all << self
    end
    
    def self.all #returns all existing artists
        @@all
    end
    
    def songs #lists all songs that belong to this artist
        Song.all.select{|song| song.artist == self} #song.artist is asking if the current song instance is equal to the current instance 
        # binding.pry
    end

    def add_song(song) # keeps track of an artist's songs
        song.artist = self
    end

    def self.find(name)
        self.all.find {|artist| artist.name == name }
    end

    def self.find_or_create_by_name(name)
        self.find(name) ? self.find(name) : self.new(name)
    end

    def print_songs # lists all of the artists songs
        songs.each {|song| puts song.name}
    end

end