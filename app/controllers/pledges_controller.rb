class PledgesController < ApplicationController
	before_filter :load_project, :require_login 
	
	def new
		@pledge = Pledge.new
	end

	def create
		@pledge = Pledge.new(
			amount: params[:pledge][:amount],
			project_id: @project.id,
			user_id: current_user.id)

		if @pledge.save
			UserMailer.new_pledge(@pledge).deliver
			redirect_to @project, notice: "Thanks for pledging"
		else
			render 'new'
		end
	end

	def index
		@pledges = @project.pledges.all
		#all pledges under this project
	end

	private

	def load_project
		@project = Project.find(params[:project_id])
	end

end
