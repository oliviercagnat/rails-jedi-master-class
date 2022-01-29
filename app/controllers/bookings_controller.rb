class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    booking_policy_authorize
  end

  def create
    @lesson = Lesson.find(params[:lesson_id])
    @booking = Booking.new
    @booking.lesson = @lesson
    @booking.user = current_user
    if @booking.save
      redirect_to lesson_booking_path(@lesson, @booking)
      flash[:notice]="Lesson booked!!"
    else
      render :show
    end
    booking_policy_authorize
  end

  def show
    @lesson = Lesson.find(params[:lesson_id])
    @booking = Booking.find(params[:id])
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
