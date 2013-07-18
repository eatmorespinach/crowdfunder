class ProjectsController < ApplicationController

	def index
		@projects = Project.order('created_at DESC').page params[:page]
		@allprojects = Project.all

	end

	def home
	end

	def show
		@project = Project.find(params[:id])
	end

end
