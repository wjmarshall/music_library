require "track"

RSpec.describe Track do
  let(:track_1) { Track.new("Sledgehammer", "Peter Gabriel") }
  let(:track_2) { Track.new("Englishman in New York", "Sting") }
  
  describe "#initialize" do
    it "accepts a title and an artist as strings" do
      expect(track_1.instance_variable_get(:@title)).to eq("Sledgehammer")
      expect(track_1.instance_variable_get(:@artist)).to eq("Peter Gabriel")
    end
  end

  describe "#matches?" do
    it "accepts a keyword as a string and returns true if the keyword matches either the title or artist" do
      expect(track_1.matches?("Sledgehammer")).to eq(true)
      expect(track_2.matches?("Sledgehammer")).to eq(false)
      expect(track_1.matches?("Sting")).to eq(false)
      expect(track_2.matches?("Sting")).to eq(true)
    end
  end
end