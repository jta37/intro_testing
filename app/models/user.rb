class User < ActiveRecord::Base
	has_secure_password

	validates_confirmation_of :email

	validates_presence_of :email_confirmation
  validates_presence_of :password_confirmation
  validates_length_of :password, minimum: 8

  validates_format_of :email, with: /.+@.+/
  validates_format_of :password, with: /.*(([A-Z].*[a-z])|([a-z].*[A-Z])).*/
	
	has_many :articles
end
