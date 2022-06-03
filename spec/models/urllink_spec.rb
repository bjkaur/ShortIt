require 'rails_helper'

RSpec.describe Urllink, type: :model do

  it "it always has an original URL and a seven character string output" do 
    url_link = Urllink.new(
        original_url: "https://www.amazon.co.uk/%E9%80%9A%E7%94%A8-Standing-Clothes-Jackets-Umbrellas/dp/B09QLSGLVJ/ref=sr_1_22?crid=14T2PEZTB7HI4&keywords=coat+stand&qid=1654185626&sprefix=coat+stand%2Caps%2C429&sr=8-22",
        seven_char_string: "4567890"
    )
    url_link.save
  end

  it "always has a seven character string output" do 
  end 
end
