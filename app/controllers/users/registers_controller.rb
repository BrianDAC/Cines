class Users::RegistersController < ApplicationController

	layout 'private'
	def new
		@user=User.new
	end
	def create
  	@user = User.new(permit_params)

	  	if @user.save
	  		 redirect_to message_path
	  		
	  	else
	  		render 'new'
	  	end
    end

    private

	def permit_params
  		params.require(:user).permit(:name, :lastname, :email, :password, :dateregister)
 	end













end
