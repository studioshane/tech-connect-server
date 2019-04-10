class UsersController < ApplicationController
       before_action :find_user, only: [:show] 



    def index 
      @user = User.all
    render json: @user
    end 


    def show
      render json: @event
    end 

    # def profile
    #   render json: {user: UserSerializer.new(current_user)}, status : :accepted
    # end 

    def login
      @user = User.find_by(email: user_params[:email])
      if @user && @user.authenticate(user_params[:password])
       if  @user.technician 
          render json: @user.technician
        else 
          render json: @user.producer
        end 
      else render json: {error: "email and password combination not found"}, status: 400
      end 
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
