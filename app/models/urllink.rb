class Urllink < ApplicationRecord
    # Checks if seven_char_string and original url exists
    # Checks if seven character string output is unique
    validates_presence_of :seven_char_string, :original_url
    validates_uniqueness_of :seven_char_string

    #Test: Model/ it is INVALID if it URL is NOT formatted suitabily
    validate :original_url_format

    def original_url_format
    # Original url or empty string
        uri = URI.parse(original_url || "")
        if uri.host.nil?
            # Errors that add original url
            errors.add(:original_url, "Invalid URL format")
        end
    end

    def shortened_url
        "http://localhost:3000/#{seven_char_string}"
    end
end
