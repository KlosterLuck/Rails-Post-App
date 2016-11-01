require 'test_helper'

class JobptypesControllerTest < ActionController::TestCase

	def setup
		@jobtype = Jobtype.create(name: "freelance")
		@employer = Employer.create(email: "john@example.com", password: "password", admin: true)
	end

	test "Should get jobtypes index" do
		get :index
		assert_response :success
	end

	test "Should get new" do
		session[:employer_id] = @employer.id
		get :new
		assert_response :success
	end

	test "should get show" do
		get(:show, { 'id' => @jobtype.id})
		assert_response :success
	end

	test "should redirect create when admin not logged in" do
		assert_no_difference "Jobtype.count" do
			post :create, jobtype: { name: "freelance" }
		end
		assert_redirected_to jobtypes_path
	end
end