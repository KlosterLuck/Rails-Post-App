require 'test_helper'

class ListJobtypesTest < ActionDispatch::IntegrationTest

	def setup
		@jobtype = Jobtype.create(name: "part-time")
		@jobtype2 = Jobtype.create(name: "full-time")
	end

	test "should show jobtypes listing" do
		get jobtypes_path
		assert_template 'jobtypes/index'
		assert_select "a[href=?]", jobtype_path(@jobtype), text: @jobtype.name
		assert_select "a[href=?]", jobtype_path(@jobtype2), text: @jobtype2.name
	end
end