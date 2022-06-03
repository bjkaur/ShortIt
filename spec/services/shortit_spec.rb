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
    it "always gives same URL the same seven character string" do 
        original_url = "https://www.amazon.co.uk/%E9%80%9A%E7%94%A8-Standing-Clothes-Jackets-Umbrellas/dp/B09QLSGLVJ/ref=sr_1_22?crid=14T2PEZTB7HI4&keywords=coat+stand&qid=1654185626&sprefix=coat+stand%2Caps%2C429&sr=8-22"
        shortit = Shortit.new(original_url)
        string_one = shortit.seven_char_string

        original_url = "https://www.amazon.co.uk/%E9%80%9A%E7%94%A8-Standing-Clothes-Jackets-Umbrellas/dp/B09QLSGLVJ/ref=sr_1_22?crid=14T2PEZTB7HI4&keywords=coat+stand&qid=1654185626&sprefix=coat+stand%2Caps%2C429&sr=8-22"
        shortit = Shortit.new(original_url)
        string_two = shortit.seven_char_string

        expect(string_one).to eq(string_two)
    end

end