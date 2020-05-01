class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  include EventsHelper
  
  def new
    @event = User.find(session[:current_user_id]).events.build
  end

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

  def edit
  end

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

  def index
    @events = Event.all
    if session[:current_user_id].is_a? Integer
      @user = User.find(session[:current_user_id])
    else
      @user = User.first
    end
    @upcoming_events = @events.where('event_date > ?', Date.today).all
    @prev_events = @events.where('event_date < ?', Date.today).all
  end

  def show
    @attendances = @event.attendances
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def assit
    @guest = Attendance.new(attendace_params)

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

  
end
