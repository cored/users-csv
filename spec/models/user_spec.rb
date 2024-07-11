require 'rails_helper'

RSpec.describe User, type: :model do
	describe "validations" do
		it "validates presence of name" do
			user = User.new(password: "Strong1Password")
			user.valid?
			expect(user.errors[:name]).to include("can't be blank")
		end

		it "validates presence and format of password" do
			user = User.new(name: "John")

			# Invalid passwords
			invalid_passwords = [
				'weak',
				'abc123',
				'PASSWORD123',
				'1234567890',
				'Abcdefghijkkk', # too long
				'Abc1',          # too short
				'AAbc123',       # repeating characters
				'aAbbbC123'      # repeating characters
			]

			invalid_passwords.each do |password|
				user.password = password
        expect(user).to_not be_valid
			end

			# Valid passwords
			valid_passwords = [
				'Strong1Password',
				'Another123Pass'
			]

			valid_passwords.each do |password|
				user.password = password
        expect(user).to be_valid
			end
		end

		it "validates length of password" do
			user = User.new(name: "John")

			user.password = 'Abcdefghijkkk' # too long
			expect(user).to_not be_valid

			user.password = 'Abc1' # too short
			expect(user).to_not be_valid
		end
	end
end
