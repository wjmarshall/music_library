require "music_library"

RSpec.describe MusicLibrary do
  subject(:music_library) { MusicLibrary.new }
  let(:track_1) { double(:track_1, title: "Sledgehammer", artist: "Peter Gabriel") }
  let(:track_2) { double(:track_2, title: "Englishman in New York", artist: "Sting") }
  let(:track_3) { double(:track_3, title: "Steam", artist: "Peter Gabriel") }

  describe "#initialize" do
    it "sets the instance variable @tracks to an empty array" do
      expect(music_library.instance_variable_get(:@tracks)).to eq([])
    end
  end

  describe "#add" do
    it "accepts a track and adds it to the @tracks array" do
      music_library.add(track_1)
      expect(music_library.instance_variable_get(:@tracks)).to eq([track_1])
      music_library.add(track_2)
      expect(music_library.instance_variable_get(:@tracks)).to eq([track_1, track_2])
    end
  end

  describe "#all" do
    it "returns a list of track objects in the music library" do
      music_library.add(track_1)
      expect(music_library.all).to eq([track_1])
      music_library.add(track_2)
      expect(music_library.all).to eq([track_1, track_2])
    end
  end

  describe "#search" do
    it "accepts a keyword as a string and returns a list of tracks that match that keyword" do
      music_library.add(track_1)
      music_library.add(track_2)
      music_library.add(track_3)
      allow(track_1).to receive(:matches?) do |keyword|
        track_1.title.include?(keyword) || track_1.artist.include?(keyword)
      end
      allow(track_2).to receive(:matches?) do |keyword|
        track_2.title.include?(keyword) || track_2.artist.include?(keyword)
      end
      allow(track_3).to receive(:matches?) do |keyword|
        track_3.title.include?(keyword) || track_3.artist.include?(keyword)
      end
      expect(music_library.search("Sledgehammer")).to eq([track_1])
      expect(music_library.search("Peter Gabriel")).to eq([track_1, track_3])
      expect(music_library.search("Kate Bush")).to eq([])
    end
  end
end

