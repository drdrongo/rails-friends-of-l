class TicketsController < ApplicationController


  def update
    @ticket = Ticket.find(params[:id])
    authorize @ticket
    
    @ticket.update(ticket_params)
    redirect_back fallback_location: event_path(@ticket.event)
  end

  private

  def ticket_params
    params.require(:ticket).permit(:status)
  end
end
