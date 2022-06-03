require 'rails_helper'

RSpec.describe Urllink, type: :model do

  # Test 1
  it "it is VALID if it has an original URL and a seven character string output" do 
    url_link = Urllink.new(
        original_url: "https://www.amazon.co.uk/%E9%80%9A%E7%94%A8-Standing-Clothes-Jackets-Umbrellas/dp/B09QLSGLVJ/ref=sr_1_22?crid=14T2PEZTB7HI4&keywords=coat+stand&qid=1654185626&sprefix=coat+stand%2Caps%2C429&sr=8-22",
        seven_char_string: "4567890"
    )
    
    # Checks link is valid (does not have any problems and return true
    expect(url_link.valid?).to be(true)
  end

  # Test 2
  # validates presence of seven character string
  it "it is INVALID if URL does NOT have a seven character string output" do 
    url_link = Urllink.new(
        original_url: "https://www.amazon.co.uk/%E9%80%9A%E7%94%A8-Standing-Clothes-Jackets-Umbrellas/dp/B09QLSGLVJ/ref=sr_1_22?crid=14T2PEZTB7HI4&keywords=coat+stand&qid=1654185626&sprefix=coat+stand%2Caps%2C429&sr=8-22",
    )
    
    # Checks link is valid (does not have any problems and return false
    expect(url_link.valid?).to be(false)
  end

  # Test 3
  # validates presence of original url
  it "it is INVALID if does NOT have an original URL" do 
    url_link = Urllink.new(
        seven_char_string: "4567890"
    )
    
    # Checks link is valid (does not have any problems and return false
    expect(url_link.valid?).to be(false)
  end

  # Test 4
  # Validates uniqueness of Seven Character String
  it "It is INVALID if the seven character string already exists" do
    url_link = Urllink.new(
      original_url: "https://www.amazon.co.uk/%E9%80%9A%E7%94%A8-Standing-Clothes-Jackets-Umbrellas/dp/B09QLSGLVJ/ref=sr_1_22?crid=14T2PEZTB7HI4&keywords=coat+stand&qid=1654185626&sprefix=coat+stand%2Caps%2C429&sr=8-22",
      seven_char_string: "4567890"
    )
    url_link.save

    url_link2 = Urllink.new(
      original_url: "https://www.amazon.co.uk/%E9%80%9A%E7%94%A8-Standing-Clothes-Jackets-Umbrellas/dp/B09QLSGLVJ/ref=sr_1_22?crid=14T2PEZTB7HI4&keywords=coat+stand&qid=1654185626&sprefix=coat+stand%2Caps%2C429&sr=8-22",
      seven_char_string: "4567890"
    )
    expect(url_link2.valid?).to be(false)
  end 


end
