class BookingsController < ApplicationController
  def new
    @lesson = Lesson.find(params[:lesson_id])
    @user = User.find(params[:user_id])
    @booking = Booking.new
    booking_policy_authorize
  end

  def create
    @booking = Booking.new(booking_params)
    @lesson = Lesson.find(params[:lesson_id])
    @user = User.find(params[:user_id])
    @booking.lesson = @lesson
    @booking.user = @user
    if @booking.save
      redirect_to lesson_path(@lesson)
    else
      render :new
    end
    booking_policy_authorize
  end

    def destroy
      @booking = Booking.find(params[:id])
      @booking.destroy
      redirect_to lesson_path(@booking.lesson)
      booking_policy_authorize
    end

    private

    def booking_policy_authorize
      authorize @booking
    end

    def booking_params
      params.require(:booking).permit(:user_id, :lesson_id)
    end
end
