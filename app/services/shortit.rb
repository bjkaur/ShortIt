require 'digest/sha2'
class Shortit

    #attribute reader to read original_url
    attr_reader :original_url
    
    def initialize(orginal_url)
        @original_url = original_url
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
        Digest::SHA256.hexdigest(original_url.to_s)[0..6]


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
end