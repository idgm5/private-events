class UsersController < ApplicationController
  include UsersHelper
  before_action :set_user, only: [:show, :edit, :update]

  def create
    @user = User.new(user_params)
    
    if @user.save
      session[:current_user_id] = @user.id
      redirect_to root_path
    end
  end

  def show

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
