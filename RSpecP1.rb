 RSpec.describe Artist do
  describe "#initialize" do
    it "initializes with default values when no arguments are provided" do
      artist = Artist.new
      expect(artist.name).to eq("unknown")
      expect(artist.birth_year).to eq(-1)
      expect(artist.death_year).to eq(-1)
    end

    it "initializes with provided values" do
      artist = Artist.new("Leonardo da Vinci", 1452, 1519)
      expect(artist.name).to eq("Leonardo da Vinci")
      expect(artist.birth_year).to eq(1452)
      expect(artist.death_year).to eq(1519)
    end
  end

  describe "#print_info" do
    it "prints artist information with birth and death years" do
      artist = Artist.new("Vincent van Gogh", 1853, 1890)
      expect { artist.print_info }.to output("Artist: Vincent van Gogh (1853 to 1890)\n").to_stdout
    end

    it "prints artist information with only birth year when death year is not provided" do
      artist = Artist.new("Pablo Picasso", 1881)
      expect { artist.print_info }.to output("Artist: Pablo Picasso (1881 to present)\n").to_stdout
    end

    it "prints unknown artist information when birth year is not provided" do
      artist = Artist.new
      expect { artist.print_info }.to output("Artist: unknown (unknown)\n").to_stdout
    end
  end
end

RSpec.describe Artwork do
  describe "#initialize" do
    it "initializes with default values when no arguments are provided" do
      artwork = Artwork.new
      expect(artwork.title).to eq("unknown")
      expect(artwork.year_created).to eq(-1)
      expect(artwork.artist.name).to eq("unknown")
    end

    it "initializes with provided values" do
      artist = Artist.new("Leonardo da Vinci", 1452, 1519)
      artwork = Artwork.new("Mona Lisa", 1503, artist)
      expect(artwork.title).to eq("Mona Lisa")
      expect(artwork.year_created).to eq(1503)
      expect(artwork.artist.name).to eq("Leonardo da Vinci")
    end
  end

  describe "#print_info" do
    it "prints artwork information" do
      artist = Artist.new("Vincent van Gogh", 1853, 1890)
      artwork = Artwork.new("Starry Night", 1889, artist)
      expect { artwork.print_info }.to output("Artist: Vincent van Gogh (1853 to 1890)\nTitle: Starry Night, 1889\n").to_stdout
    end
  end
end

