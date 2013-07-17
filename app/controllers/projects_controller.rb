class ProjectsController < ApplicationController

	def index
		@projects = Project.all
	end

	def home
	end

end
