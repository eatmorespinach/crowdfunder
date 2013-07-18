class My::ProjectsController < ApplicationController
	before_filter :correct_user, only: [:edit, :update]

	def new
		@project = Project.new
	end

	def create
		@project = current_user.projects.build(params_project)

		if @project.save
			redirect_to my_projects_path, :notice => "Project created"
		else 
			flash.now.alert = "Try again"
			render 'new'
		end
	end

	def index
		@projects = Project.where(user_id: current_user.id)
	end

	def edit
		@project = Project.find(params[:id])
	end

	def update

		@project = Project.find(params[:id])

		if @project.update_attributes(params_project)
			redirect_to my_projects_path, notice: "Project Updated"
		else
			render 'new'
		end
	end

	private

	def correct_user
		@project = Project.find(params[:id])
		unless @project.user_id == current_user.id
			redirect_to root_path, notice: "Project doesn't exist"
		end
	end

	def params_project
		params.require(:project).permit(:title, :teaser, :goal, :description)
	end

end
