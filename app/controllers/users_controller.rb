class UsersController < ApplicationController
       before_action :find_user, only: [:show] 



    def index 
      @user = User.all
    render json: @user
    end 


    def show
      render json: @event
    end 

         private 

    def find_user
        @user = User.find_by(id: params[:id])
        render json: {error:"User with id #{params[:id]} not found"}, status: 404 unless @user
    end

    def user_params
        params.require(:user).permit(
            :email,
            :password
        )
    end 
end
