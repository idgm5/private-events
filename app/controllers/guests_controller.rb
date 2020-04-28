class GuestsController < ApplicationController
  def create
    @guest = Guest.new(guest_params)
    respond_to do |format|
      if @guest.save
        format.html { redirect_to @guest, notice: 'You are now assiting this event!' }
        format.json { render :show, status: :created, location: @guest }
      else
        format.html { render :new }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def guest_params
     params.require(:guest).permit(:user_id, :post_id)
  end
end
