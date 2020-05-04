class UsersController < ApplicationController
  include UsersHelper
  before_action :set_user, only: %i[show edit update]

  def create
    @user = User.new(user_params)    

    if @user.save
      session[:current_user_id] = @user.id
      flash[:notice] = "User was successfully created!"
      redirect_to root_path    
    elsif @user.name ==nil || @user.name =="" || @user.name.blank?
      flash[:notice] = "User name can't be nil"
      redirect_to new_user_path
    else            
      flash[:notice] = @user.errors.full_messages      
      redirect_to new_user_path
    end
  end

  def sign_in
    @user = User.new
  end

  def login 
    if User.find_by(name: params[:name])
      @user = User.find_by(name: params[:name])
      session[:current_user_id] = @user.id
      flash[:notice] = "Login successful!"
      redirect_to root_path    
    else 
      flash[:notice] = "User does not exists!"
      redirect_to sign_in_path
    end    
  end

  def destroy
    cookies.delete(:current_user_id)    
    session.delete(:current_user_id)    
    redirect_to sign_in_path
  end

  def show
    @upcoming_events = @user.events_as_guest.where('event_date > ?', Date.today).all
    @prev_events = @user.events_as_guest.where('event_date < ?', Date.today).all
  end

  def edit
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
  end
end
