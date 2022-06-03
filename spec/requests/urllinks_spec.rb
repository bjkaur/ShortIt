require 'rails_helper'

RSpec.describe "Urllinks", type: :request do
  it "can make link short provided by a user" do
    #getting user input using https and using post request because of using database        
    url = "https://www.amazon.co.uk/testing/12345"
    post "/urllinks", params: { urllink: url }
    urllink = assigns(:urllink)
    expect(urllink.original_url).to eq(url)
    expect(urllink.valid?).to be(true)
    expect(urllink.seven_char_string.length).eq(7)
  end

end