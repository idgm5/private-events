class GuestsController < ApplicationController
  def new
    @guest = Guest.new
    @user = User.find(session[:current_user_id])
    @users = User.all
  end

  def create
    @guest = Guest.new(guest_params)

    respond_to do |format|
      if @guest.save
        format.html { redirect_to root_path, notice: 'You send the invitation!' }
        format.json { head :no_content}
      else
        format.html { redirect_to root_path, notice: "An error happened you can't send the invitation." }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def guest_params
    params.require(:guest).permit(:user_id, :event_id)
  end
end
