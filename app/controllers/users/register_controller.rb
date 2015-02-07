class Users::RegisterController < ApplicationController

	def new
		@user=User.all
		@users=User.new
	end

  def create
    @user = User.new(permit_params)
    @users = User.find(params[:id])
    if @user.save
      redirect_to new_users_register_path
    else
      render 'new'
    end
  end

	def registerlogin
		@user=User.all
		@users=User.new
	end





  private

  def permit_params
    params.require(:user).permit(:name, :lastname, :email, :dateregister, :password, :phone, :cel)
  end






















end
