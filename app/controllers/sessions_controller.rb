class SessionsController < ApplicationController

	def new
	end

	def create
		user = login(params[:email], params[:password])

    if user
  		redirect_to root_url, :notice => "Logged in!"
  	else
  		flash.now.alert = "Incorrect email or password"
  		render :new
  	end

	def destroy
		logout
		redirect_to root_path
	end


end
