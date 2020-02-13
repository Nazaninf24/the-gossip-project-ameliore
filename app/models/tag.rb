class Tag < ApplicationRecord
	has_many :links
	has_many :gossips, through: :links 

end
