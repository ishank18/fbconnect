class CustomUsersController < ApplicationController
  
  def new
  	@user = User.new
  end

	def create
		@user = User.new(params[:user])
		if @user.save(:validate => false)
			redirect_to custom_user_path(@user), :alert => "User Successfully Update!"		
		else
			render :action => "new"
		end	
	end

	def edit
		@user = User.where(:id => params[:id]).first
	end
	
	
	def update
		@user = User.where(:id => params[:id]).first	
		if(@user.update_attributes(params[:user]))
			redirect_to custom_user_path(@user), :alert => "User Successfully Update!"
		else
			render :text => "Done"	
		end
	end
	
	def index
		@users = User.all
	end
	
	def show
		@user = User.where(:id => params[:id]).first
	end

end
