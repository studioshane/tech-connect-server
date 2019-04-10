class ProducersController < ApplicationController
    before_action :find_producer, only: [:show, :events] 



    def index 
      @producers = Producer.all
    render json: @producers
    end

    def show
      render json: @producer
    end 


    def create
      @user = User.new(user_params)
        if @user.save
          @producer = Producer.new(producer_params)
           @producer.user = @user
             if @producer.save 
              render json: @producer  
            
             else 
                render json: {error:"Producer cannot be created"}, status: 400
             end 
        else 
          render json: {error:"User cannot be created"}, status: 400
        end 
    end 


    def events
        render json: @producer.events if @producer
    end 

         private 

    def find_producer
        @producer = Producer.find_by(id: params[:id])
        render json: {error:"Producer with id #{params[:id]} not found"}, status: 404 unless @producer
    end

    def producer_params
        params.require(:producer).permit(
            :name,
            :email,
            :phone,
            :company,
            :user_id
        )
    end 

    def user_params
    params.require(:producer).permit(
     :email,
     :password
    )
    end 
end




