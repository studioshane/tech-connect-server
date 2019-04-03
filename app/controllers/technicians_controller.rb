class TechniciansController < ApplicationController
    before_action :find_technician, only: [:show] 



    def index 
    @technicians = Technician.all
    render json: @technicians
    end

    def show
      render json: @technician
    end 

    def create
        @technician = Technician.new
        if @technician.save 
            render json: @technician  
        else 
            render json: {error:"Technician cannot be created"}, status: 400
        end 
    end 

         private 

    def find_technician
        @technician = Technician.find_by(id: params[:id])
        render json: {error:"Technician with id #{params[:id]} not found"}, status: 404 unless @technician
    end

    def technician_params
        params.require(:technician).permit(
            :name,
            :email,
            :phone,
            :day_rate,
            :audio, 
            :video,
            :lighting,
            :general,
            :user_id
        )
    end 
end
