class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(params_user)

		if @user.save
			redirect_to root_path, :notice => "Account created"
		else 
			render 'new'
		end
	end

	private

	def params_user
		params.require(:user).permit(:email, :first_name, :last_name, :password) 
	end
end
