class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments

	validates :post, presence: true
	validate :must_include_codeacademy

	def must_include_codeacademy
		if post.length < 12
			errors.add(:must_include_codeacademy, "must have codeacademy")
		end
	end

end

