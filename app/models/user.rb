class User < ApplicationRecord
	has_many :invites
	# geocoded_by :longitude, :latitude
	# after_validation :geocode
end
