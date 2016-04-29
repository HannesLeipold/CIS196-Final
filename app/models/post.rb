class Post < ActiveRecord::Base
validates :title, :content, presence: true
validates :period, numericality: { only_integer: true, greater_than: 5, less_than_or_equal_to: 30}
belongs_to :user

  def has_session?
    !( self.user_id.nil? || self.guest_id.nil? )
  end

end
