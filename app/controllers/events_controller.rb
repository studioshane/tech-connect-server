class EventsController < ApplicationController
  
  before_action :find_event, only: [:show, :destroy, :update, :remove_technician]
    
    
    def index 
      @events = Event.all
       render json: @events
    end 

    def show
      render json: @event
    end 

    def create
      @event = Event.new(event_params)
      @event.producer_id = params[:event][:id]
      @event.title = params[:event][:company]
        if @event.save
          render json: @event
        else 
          render json: {error:"Event cannot be created"}, status: 400
        end 
    end 

     def destroy
        @event.destroy
        render json: @event
    end

    def remove_technician
      
    end 




         private 

     def find_event
        @event = Event.find_by(id: params[:id])
        render json: {error:"Event with id #{params[:id]} not found"}, status: 404 unless @event
    end

    def event_params
        params.require(:event).permit(
            :client,
            :venue,
            :start,
            :end,
            :techs_required,
        )
    end 
end
