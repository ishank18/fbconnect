class UsersController < ApplicationController
  
  def new
  	@user = User.new
  end

	def create
		@user = User.new(params[:user])
		if @user.save(:validate => false)
			render :text => "Done"			
		else
			render :text => "Error"
		end	
	end

end
