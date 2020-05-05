module EventsHelper
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:description, :event_date, :location)
  end

  def attendace_params
    params.permit(:user_id, :event_id)
  end
end
