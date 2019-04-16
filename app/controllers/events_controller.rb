class EventsController < ApplicationController
  
  before_action :find_event, only: [:available_technicians, :show, :destroy, :update, :remove_technician_from_event, :add_technician_to_event]
  before_action :find_technician, only: [:add_technician_to_event]
    def index 
      @events = Event.all
       render json: @events
    end 

    def show
      render json: @event
    end 

    def available_technicians
      render json: Technician.is_available_between(@event.start, @event.end)
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

    def remove_technician_from_event
      @event.technician_ids = @event.technician_ids.select do |id| 
         id != params[:technician][:id]
            end 
          if @event.save
            render json: @event
          else 
            render json: {error: "Technician could not be removed"}, status: 400
          end 
    end 

    def add_technician_to_event
      if @event.techs_required == @event.technicians.length || @event.technician_ids.include?(params[:technician_id])
        render json: {error: "event already has enought technicians or technician is already booked for this event"}, status: 400
      else  
        @event.technicians << @technician
          if @event.save
            render json: @event
          else 
            render json: {error: "technician could not be added"}, status: 400
          end 
      end 
    end 

         private 

    def find_event
        @event = Event.find_by(id: params[:id])
        render json: {error:"Event with id #{params[:id]} not found"}, status: 404 unless @event
    end

    def find_technician
        @technician = Technician.find_by(id: params[:technician_id])
        render json: {error:"Event with id #{params[:technician_id]} not found"}, status: 404 unless @technician
    end

    def event_params
        params.require(:event).permit(
            :client,
            :venue,
            :start,
            :end,
            :techs_required,
            :technician_id
        )
    end 
end
