class Jobtype < ActiveRecord::Base
	has_many :post_jobtypes
	has_many :posts, through: :post_jobtypes
	validates :name, presence: true, length: { minimum: 3, maximum: 25 }
	validates_uniqueness_of :name

end