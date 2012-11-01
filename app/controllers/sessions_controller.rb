class SessionsController < ApplicationController

	def new

	end

	def create
		user = User.find_by_email(params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_to user
		else
			if user == nil
				# display invaid email error message if user is not found
				# need to figure out how to get the flash to disappear on the sign-up page
				flash.now[:error] = "Invalid email address. #{view_context.link_to('Sign up now', signup_path)}.".html_safe
			else
				# otherwise display invalid password
				flash.now[:error] = "Invalid password."
			end
			render 'new'
		end

	end

	def destroy
		sign_out
		redirect_to root_path
	end
end
