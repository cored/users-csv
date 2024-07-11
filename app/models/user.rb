class User < ApplicationRecord
	validates :name, presence: true
	validates :password, presence: true, length: { in: 10..16 }, format: {
		with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?!.*([a-zA-Z\d])\1{2}).*\z/,
		message: "must include at least one lowercase letter, one uppercase letter, and one digit, and cannot contain three repeating characters in a row."
	}
end
