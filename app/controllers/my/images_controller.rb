class My::ImagesController < ApplicationController
before_filter :load_project
	def index
		@images = Image.where(project_id: params[:project_id])
		@image = Image.new
	end


	def create
		@image = @project.images.build(params_image)

		if @image.save
			redirect_to my_project_images_path(@project), notice: "Image Uploaded"
		else
			redirect_to my_project_images_path(@project), alert: "Non image files not allowed"
		end
	end

	private

	def params_image
		params.require(:image).permit(:file)
	end


	def load_project
		@project = Project.find(params[:project_id])
	end

end