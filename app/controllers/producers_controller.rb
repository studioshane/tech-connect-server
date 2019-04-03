class ProducersController < ApplicationController
    before_action :find_producer, only: [:show] 



    def index 
      @producers = Producer.all
    render json: @producers
    end

    def show
      render json: @event
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
end
