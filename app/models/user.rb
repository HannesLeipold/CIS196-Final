require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  has_many :statuses, dependent: :destroy
  has_many :groups_users, dependent: :destroy
  has_many :groups, through: :groups_users
  has_many :posts, dependent: :destroy
  validates :name, presence: true, uniqueness: true, length: { minimum: 2 }
  validates :email, presence: true

  def password
    @password ||= Password.new(password_hash) unless password_hash.nil?
  end

  def has_session?
    self.session_exists unless self.session_exists.nil?
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
