class EventsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]

  def index
    #@events = Event.where(user_id:[current_user])
    @events = Event.where(see_all: [1])
  end

  def my
    @events = Event.where(user_id:[current_user])
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id

    if @event.save
      flash[:notice] = "Event created"
      redirect_to @event
    else
      render :action => 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:notice] = "Update event"
      redirect_to @event
    else
      render :action => 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = "Destoroyed event"
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :event_time, :event_end_time, :user_id, :see_all, :every_day, :every_week, :every_month, :every_year)
  end

end
