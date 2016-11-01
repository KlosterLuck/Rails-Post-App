class Post < ApplicationRecord
	belongs_to :employer
	has_many :post_jobtypes
	has_many :jobtypes, through: :post_jobtypes
	validates :title, presence: true, length: {minimum: 3, maximum: 50}
	validates :description, presence: true, length: {minimum: 3, maximum: 50}
	validates :employer_id, presence: true

	def self.search(search)
  		where("title LIKE ?", "%#{search}%")
  		where("description LIKE ?", "%#{search}%")
	end

end
