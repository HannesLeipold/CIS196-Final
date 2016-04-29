class Chatroom < ActiveRecord::Base
validates :exists, presence: true
validates :duration, presence: true

end
