class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new()
    @user.name = params[:user][:name]
    @user.save
    render :new
  end

  def new
     @user = User.new 
  end
end
