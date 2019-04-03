class EventsController < ApplicationController
  
  before_action :find_event, only: [:show, :destroy, :update]
    
    
    def index 
      @events = Event.all
       render json: @events
    end 

    def show
      render json: @event
    end 

         private 

     def find_event
        @event = Event.find_by(id: params[:id])
        render json: {error:"Event with id #{params[:id]} not found"}, status: 404 unless @event
    end

    def event_params
        params.require(:event).permit(
            :producer_id,
            :client,
            :venue,
            :start_date,
            :end_date,
            :techs_required
        )
    end 
end
