class JobtypesController < ApplicationController
	before_action :require_admin, except: [:index, :show]

	def index
		@jobtypes = Jobtype.all
	end

	def new
		@jobtype = Jobtype.new
	end

	def create
		@jobtype = Jobtype.new(jobtype_params)
		if @jobtype.save
			flash[:success] = "Jobtype was create successfully"
			redirect_to jobtypes_path

		else
			render 'new'
		end

	end

	def edit
		@jobtype = Jobtype.find(params[:id])
	end

	def update
		@jobtype = Jobtype.find(params[:id])
		if @jobtype.update(jobtype_params)
			flash[:succes] = "Jobtype name was successfully updated"
			redirect_to jobtype_path(@jobtype)
		else
			render 'edit'
		end
	end

	def show
		@jobtype = Jobtype.find(params[:id])
		@jobtype_posts = @jobtype.posts
	end

	private
		def jobtype_params
			params.require(:jobtype).permit(:name)
		end

		def require_admin
			if !signed_in? || (signed_in? and !current_employer.admin?)
				flash[:danger] = "Only admins can perfom that action"
				redirect_to jobtypes_path
			end

		end

end