class Message < ApplicationRecord
	belongs_to :conversation
	belongs_to :user

	validates_presence_of :body, :conversation_id, :user_id
	# private
    def message_time
      created_at.strftime("%d/%m/%y | %l:%M %p")
    end

end

