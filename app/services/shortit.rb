require 'digest/sha2'
class Shortit

    #attribute reader to read original_url
    attr_reader :original_url, :url_link_model
    
    # Urllink model using dependency injection to be able to 
    # NOT use it directly
    # and make is reusable
    def initialize(orginal_url, url_link_model = Urllink)
        @original_url = original_url
        @url_link_model = url_link_model
    end

    # Returns a string
    # Parses URL to Digest and gives a seven character code
    def seven_char_string
        # Takes first 7 characters and converts to string from Digest
        # Digest almost always returns same output for the sames string
        # therefore, unlikely to get two duplicates seven character string for 
        # the given original URLs
        # Neverthless, only getting first 7 string can limit the quality 
        # of the outcome, but unlikely 

        # Gets the seven character code
        # checks if the code exists already 
        # otherwise get another seven character code
        # break out of the loop if seven character code does NOT exist in the database
        i = 0
        loop do
            seven_char_code = get_seven_char_code(i)
            break seven_char_code unless url_link_model.exists?(seven_char_string: seven_char_code)
            i = i + 1
        end

        #"1234567"
        # Empty String
        #char_string = ""
        # 7 times count up
        # getting a random decimal number
        #7.times do |n|
            # append
            #char_string << (rand * n).round
        #end
        #char_string
    end

    def generate_short_link
        url_link_model.create(original_url: URI, seven_char_string: seven_char_string)
    end

    # not being accessed other than its own class
    private

    def get_seven_char_code(i)
        Digest::SHA256.hexdigest(original_url.to_s)[i..(i + 6)] 
    end 

end