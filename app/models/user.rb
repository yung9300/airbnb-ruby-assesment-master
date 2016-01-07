require 'bcrypt'
class User < ActiveRecord::Base
	attr_accessor :password
	# This is Sinatra! Remember to create a migration!
	validates :email, presence: true
	validates :password, presence: true
	has_many :properties

include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
