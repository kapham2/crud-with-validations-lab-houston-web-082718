class Song < ActiveRecord::Base
    # title, a string
    # Must not be blank
    # Cannot be repeated by the same artist in the same year
    validates :title, presence: true
    validates :title, uniqueness: true

    # released, a boolean describing whether the song was ever officially released.
    # Must be true or false
    validates :released, inclusion: { in: [true, false] }

    # release_year, an integer
    # Optional if released is false
    # Must not be blank if released is true
    # Must be less than or equal to the current year
    validates :release_year, presence: true, if: :released?
    validates :release_year, numericality: { less_than_or_equal_to: Time.now.year }, if: :released?
    
    # artist_name, a string
    # Must not be blank
    validates :artist_name, presence: true

    # genre, a string
    # Must not be blank
    validates :genre, presence: true

    def released?
        released
    end

end
