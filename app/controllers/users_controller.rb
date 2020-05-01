class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  include UsersHelper
  def new
    @user = User.new
  end

  def show
    @upcoming_events = @user.assisted_events.where('start_date > ?', Date.today).all
    @prev_events = @user.assisted_events.where('start_date < ?', Date.today).all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:current_user_id] = @user.id
      redirect_to root_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
  end

  private

  def set_user
      @user = User.find(params[:id])
  end
end
