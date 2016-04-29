class Group < ActiveRecord::Base
  validates :name, presence: :true
  has_many :groups_users, dependent: :destroy
  has_many :users, through: :groups_users
end
