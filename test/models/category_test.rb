require 'test_helper'

class JobtypeTest < ActiveSupport::TestCase

	def setup
		@jobtype = Jobtype.new(name: "freelance")
	end

	test "jobtype should be valid" do
		assert @jobtype.valid?

	end

	test "name should be present" do
		@jobtype.name = " "
		assert_not @jobtype.valid?
	end

	test "name should be unique" do
		@jobtype.save
		jobtype2 = Jobtype.new(name: "freelance")
		assert_not category2.valid?
	end

	test "name should not be too long" do
		@category.name = "a" * 26
		assert_not @category.valid?
	end

	test "name should not be too short" do
		@category.name = "aa"
		assert_not @category.valid?
	end


end