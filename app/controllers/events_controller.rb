class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /Events
  # GET /Events.json
  def index
    @events = Event.all
    if session[:current_user_id].is_a? Integer
      @user = User.find(session[:current_user_id])
    else
      @user = User.first
    end
    @upcoming_events = @events.where('start_date > ?', Date.today).all
    @prev_events = @events.where('start_date < ?', Date.today).all
  end

  # GET /Events/1
  # GET /Events/1.json
  def show
    @guests = @event.assistances
  end

  # GET /Events/new
  def new
    @event = User.find(session[:current_user_id]).events.build
  end

  # GET /Events/1/edit
  def edit
  end

  # POST /Events
  # POST /Events.json
  def create
    @event = User.find(session[:current_user_id]).events.build(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Events/1
  # PATCH/PUT /Events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Events/1
  # DELETE /Events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def assist
    @guest = Guest.new(guest_params)

    respond_to do |format|
      if @guest.save
        format.html { redirect_to root_path, notice: 'You are now assiting this event!' }
        format.json { head :no_content}
      else
        format.html { redirect_to root_path, notice: "An error happened you can't assist this event" }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:title, :body, :start_date)
    end

    def guest_params
      params.permit(:user_id, :event_id)
    end
end
