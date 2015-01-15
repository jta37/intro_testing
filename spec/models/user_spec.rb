require 'rails_helper'

RSpec.describe User, :type => :model do

  describe "validations" do

    it "should confirm a user :email" do
        user = User.new({email: "blah", email_confirmation: "bla"})
        expect(user.save).to be(false)
    end

    it "should confirm a user :password" do
        user = User.new({password: "blah", password_confirmation: "bla"})
        expect(user.save).to be(false)
    end

    it "should not create a user with a blank password" do
        user = User.new({email: "blah@blah.com", email_confirmation: "blah@blah.com"})
        expect(user.save).to be(false)
    end

    it "should not create a user with a blank email" do
        user = User.new({password: "blah", password_confirmation: "blah"})
        expect(user.save).to be(false)
    end

    it "should require :password confirmation" do
        user = User.new({email: "blah@blah.com", email_confirmation: "blah@blah.com", password: "blah"})
        expect(user.save).to be(false)
    end

    it "should require :email confirmation" do
        user = User.new({email: "blah@blah.com", password: "blah", password_confirmation: "blah"})
        expect(user.save).to be(false)
  	end

  	it "should validate the password length is >= 8 characters" do
  		user = User.new({email: "bilbo@gmail.com", email_confirmation: "bilbo@gmail.com",
  										password: "seven", password_confirmation: "seven"})
  		expect(user.save).to be(false)
  	end

  	it "should validate the :email format to be" do
  		user = User.new({email: "bilbo", email_confirmation: "bilbo",
  										password: "baggins", password_confirmation: "baggins"})
  		expect(user.save).to be(false)
  	end

  	it "should validate the :password format to contain upper and lower case letters" do
  		user = User.new({email: "bilbo@gmail.com", email_confirmation: "bilbo@gmail.com",
  										password: "baggins", password_confirmation: "baggins"})
  		expect(user.save).to be(false)
  	end

  end
end
