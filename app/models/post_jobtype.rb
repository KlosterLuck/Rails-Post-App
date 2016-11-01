class PostJobtype < ActiveRecord::Base
	belongs_to :post
	belongs_to :jobtype

end