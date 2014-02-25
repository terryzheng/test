require "/home/terry/case/demo/cut.rb"
include Cut
class Song
  attr_reader :name,:artist,:duration
  def initialize(name,artist,duration)
    @name = name
    @artist = artist
    @duration = duration
  end
end

class KaraokSong < Song
   @@play = 0 
   def initialize(name,artist,duration,lyrics)
      super(name,artist,duration)
      @lyrics = lyrics
    end

    def name=(new_name)
      @name = new_name
    end

    def play
      puts "has play #{@@play+=1} times!"
    end
end

class SongList
  def initialize
    @songs = Array.new
  end

  def append(song)
    @songs.push(song)
    @songs.size
  end

  def delete_first
    @songs.shift
    @songs.size
  end

  def delete_last
    @songs.pop
    @songs.size
  end
end

song1 = KaraokSong.new("adf","afdf",225,"asdfad")
song2 = KaraokSong.new("adf","afdf",225,"asdfad")
song1.name = "aaa"
puts Cut.sin(song1.name)
puts cos(song2.name)

song1.play
song2.play
song1.play
