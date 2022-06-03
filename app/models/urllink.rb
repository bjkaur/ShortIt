class Urllink < ApplicationRecord
    # Checks if seven_char_string and original url exists
    # Checks if seven character string output is unique
    validates_presence_of :seven_char_string, :original_url
    validates_uniqueness_of :seven_char_string
end
