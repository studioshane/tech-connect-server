class TechniciansController < ApplicationController
    def index 
        @technicians = Technician.all
        render json: @technicians
    end 
end
