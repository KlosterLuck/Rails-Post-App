require 'test_helper'

class CreateJobtypesTest < ActionDispatch::IntegrationTest

	def setup
		@employer = Employer.create(email: "john@example.com", password: "password", admin: true)
	end

	test "get new jobtype form and create jobtype" do
		sign_in_as(@employer, "password")
		get new_jobtype_path
		assert_template 'jobtypes/new'
			assert_difference 'Jobtype.count', 1 do
			post_via_redirect jobtypes_path, jobtype: {name: "freelance"}
		end
		assert_template 'jobtypes/index'
		assert_match "freelance", response.body
	end

	test "invalid jobtype submisson result in failure" do
		sign_in_as(@employer, "password")
		get new_jobtype_path
		assert_template 'jobtypes/new'
			assert_no_difference 'Jobtype.count' do
			post jobtypes_path, jobtype: {name: " "}
		end
		assert_template 'jobtypes/new'
		assert_select 'h2.panel-title'
		assert_select 'div.panel-body'

	end
end