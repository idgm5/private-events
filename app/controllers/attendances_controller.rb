class AttendancesController < ApplicationController
  include AttendancesHelper
  def new
    @attendance = Attendance.new
    @user = User.find(session[:current_user_id])
    @users = User.all
  end

  def create
    @attendance = Attendance.new(attendance_params)

    respond_to do |format|
      if @attendance.save
        format.html { redirect_to root_path, notice: 'You send the invitation!' }
        format.json { head :no_content }
      else
        format.html { redirect_to root_path, notice: "An error happened you can't send the invitation." }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end
end
