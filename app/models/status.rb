class Status < ActiveRecord::Base
validates :text, presence: true, length: {minimum: 5}
validates_uniqueness_of :user_id
belongs_to :user
end
