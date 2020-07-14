class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]

  def index
    @events = policy_scope(Event).order(created_at: :desc)
    authorize @events
  end

  def show
    authorize @event
  end

  def new
    @event = Event.new
  end

  def create
    authorize @event
  end

  def edit
  end

  def update
    authorize @event

    if @event.update(event_params)
      redirect_to events_path
    else
      render :edit
    end
  end

  def destroy
    authorize @event

    @event.destroy
  end

  private

  def event_params
    Params.require('event').permit(:title, :description, :datetime, :venue, :capacity, :category, :user)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
