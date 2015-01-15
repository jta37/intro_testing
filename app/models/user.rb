class User < ActiveRecord::Base
	has_secure_password

	validates_confirmation_of :email

	validates_presence_of :email_confirmation
  validates_presence_of :password_confirmation
	
	has_many :articles
end
