class Gossip < ApplicationRecord
	belongs_to :user, optional: true
	has_many :links
	has_many :tags, through: :links #Un gossip peut avoir plusieurs tags

	has_many :comments

	validates :title, 
	presence: true,
	length: {minimum: 3, maximum: 14}

	validates :content,
  presence: true
end

