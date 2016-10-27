class UsersController < ApplicationController
	def new
        @user=User.new    
    end
    def index
		@user=User.all
	end

    def create
        @user= User.new(user_params)
        @user.save
        redirect_to users_list_path
    end
    def edit

		@user=User.find_by_id(params[:id])
	end
	def update
		
		@user=User.find_by_id(params[:id])
		@user.update_attributes(user_params)
		redirect_to users_list_path
	end
	def destroy
		@user=User.find_by_id(params[:id])
		@user.destroy
		redirect_to users_list_path
	end
	
	def show
		@user=User.find_by_id(params[:id])
	end
     private

        def user_params
            params.require(:user).permit(:firstname,:lastname,:email,:password)
	end
end
