require "rails_helper"

RSpec.describe Shortit do 

    # Test 1
    it "shorten a URL to a 7 Character String" do 
        # Original URL to be shorten
        orginal_url = "https://rubygems.org/gems/rspec/versions/3.5.0"
        # ShortIt class to create a instance of the class that
        # takes in original url
        shortit = Shortit.new(orginal_url)
        expect(shortit.seven_char_string.length).to eq(7)
    end

    # Test 2
    # Ensure the Seven Char String of two URls are not equal
    it "gives URL its own seven character string" do 
        orginal_url = "https://www.amazon.co.uk/%E9%80%9A%E7%94%A8-Standing-Clothes-Jackets-Umbrellas/dp/B09QLSGLVJ/ref=sr_1_22?crid=14T2PEZTB7HI4&keywords=coat+stand&qid=1654185626&sprefix=coat+stand%2Caps%2C429&sr=8-22"
        shortit = Shortit.new(orginal_url)
        string_one = shortit.seven_char_string

        orginal_url = "https://www.amazon.co.uk/%E9%80%9A%E7%94%A8-Standing-Clothes-Jackets-Umbrellas/dp/B09QLSGLVJ/ref=sr_1_22?crid=14T2PEZTB7HI4&keywords=coat+stand&qid=1654185626&sprefix=coat+stand%2Caps%2C429&sr=8-21"
        shortit = Shortit.new(orginal_url)
        string_two = shortit.seven_char_string

        expect(string_one).not_to eq(string_two)
    end

    # Test 3
    # To generate unique output
    it "creates a URL with a seven character string" do
        url_link = "https://www.amazon.co.uk/%E9%80%9A%E7%94%A8-Standing-Clothes-Jackets-Umbrellas/dp/B09QLSGLVJ/ref=sr_1_22?crid=14T2PEZTB7HI4&keywords=coat+stand&qid=1654185626&sprefix=coat+stand%2Caps%2C429&sr=8-22"
        shortit = Shortit.new(url_link)
        short_url = shortit.generate_short_link
        expect(short_url).to be_valid

        short_url2 = shortit.generate_short_link
        expect(short_url2).to be_valid 
    end

end