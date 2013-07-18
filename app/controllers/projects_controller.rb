class ProjectsController < ApplicationController
	before_filter


	def index
		@projects = Project.all
	end

	def home
	end

	def show
		@project = Project.find(params[:id])
	end

end
