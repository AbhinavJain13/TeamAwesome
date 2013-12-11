require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  attr_accessible :name, :email, :password, :password_confirmation
  has_secure_password
  before_save{|user| user.email = user.email.downcase}
  before_save :create_session_token
  
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: 6}, :if => :password_present?
  validates :password_confirmation, presence: true, :if => :password_present?

  private
    def create_session_token
      self.session_token=SecureRandom.urlsafe_base64
    end

  def password_present?
    !password.nil?
  end

end
