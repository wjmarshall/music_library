require "music_library"
require "track"

RSpec.describe "Integration" do
  subject(:music_library) { MusicLibrary.new }
  let(:track_1) { Track.new("Sledgehammer", "Peter Gabriel") }
  let(:track_2) { Track.new( "Englishman in New York", "Sting") }
  let(:track_3) { Track.new("Steam", "Peter Gabriel") }

  describe "MusicLibrary#add" do
    it "accepts a track and adds it to the @tracks array" do
      music_library.add(track_1)
      expect(music_library.instance_variable_get(:@tracks)).to eq([track_1])
      music_library.add(track_2)
      expect(music_library.instance_variable_get(:@tracks)).to eq([track_1, track_2])
    end
  end

  describe "MusicLibrary#all" do
    it "returns a list of track objects in the music library" do
      music_library.add(track_1)
      expect(music_library.all).to eq([track_1])
      music_library.add(track_2)
      expect(music_library.all).to eq([track_1, track_2])
    end
  end

  describe "MusicLibrary#search" do
    it "accepts a keyword as a string and returns a list of tracks that match that keyword" do
      music_library.add(track_1)
      music_library.add(track_2)
      music_library.add(track_3)
      expect(music_library.search("Sledgehammer")).to eq([track_1])
      expect(music_library.search("Peter Gabriel")).to eq([track_1, track_3])
      expect(music_library.search("Kate Bush")).to eq([])
    end
  end
end