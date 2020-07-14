class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def index
  end

  def show
    authorize @event
  end

  def create
    authorize @event
  end

  def destroy
    authorize @event
  end
end
