class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def index
  end

  def show
  end

  def create
    authorize @event
  end
end
