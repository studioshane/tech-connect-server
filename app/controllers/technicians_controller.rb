class TechniciansController < ApplicationController
    before_action :find_technician, only: [:show, :events] 


    def index 
    @technicians = Technician.all
    render json: @technicians
    end

    def show
      render json: @technician
    end 

    def create
      @user = User.new(user_params)
        if @user.save
          @technician = Technician.new(technician_params)
          @technician.user = @user
             if @technician.save 
              render json: @technician  
            
             else 
                render json: {error:"Technician cannot be created"}, status: 400
             end 
        else 
          render json: {error:"User cannot be created"}, status: 400
        end 
    end 

    def events
        render json: @technician.events if @technician
    end 

         private 

    def find_technician
        @technician = Technician.find_by(id: params[:id])
        render json: {error:"Technician with id #{params[:id]} not found"}, status: 404 unless @technician
    end

    def technician_params
        params.require(:technician).permit(
            :name,
            :phone,
            :day_rate,
            :audio, 
            :video,
            :lighting,
            :general,
            :email
        )
    end 

        def user_params
        params.require(:technician).permit(
         :email,
         :password
        )
    end 
end
