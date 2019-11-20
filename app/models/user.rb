class User < ApplicationRecord
	has_many :invites
	reverse_geocoded_by :latitude, :longitude
	# after_validation :reverse_geocode
	# after_validation :geocode
end
