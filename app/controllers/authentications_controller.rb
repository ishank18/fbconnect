class AuthenticationsController < ApplicationController

	skip_before_filter :authenticate_user!, :only => [:create]
	
	def create
		auth = request.env["omniauth.auth"]
		authentication = Authentication.where(:provider => auth['provider'], :uid => auth['uid']).first
		if authentication
		  flash[:notice] = "Signed in successfully."
		  sign_in_and_redirect(:user, authentication.user)
		else
		  user = User.find_or_create_by_email(auth['info']['email'])
		  user.apply_omniauth(auth)
		  if user.save(:validate => false)
		    flash[:notice] = "Account created and signed in successfully."
		    sign_in_and_redirect(:user, user)
		  else
		    flash[:error] = "Error while creating a user account. Please try again."
		    redirect_to root_url
		  end
		end
	end
	
end	
