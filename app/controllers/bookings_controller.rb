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
      # flash[:notice]="Lesson booked!!"
      redirect_to lesson_booking_path(@lesson, @booking)
    else
      render :show
    end
    booking_policy_authorize
  end

  def show
    @lesson = Lesson.find(params[:lesson_id])
    @booking = Booking.find(params[:id])
    @padawan = User.where(user_id: @booking.user.id)
    booking_policy_authorize
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    if current_user.status == "Jedi"
      redirect_to lesson_path(@booking.lesson)
    else
      redirect_to pages_user_profile_path(current_user)
    end
    booking_policy_authorize
  end

  def edit
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.update(status: params["booking"]["status"])
    flash[:notice] = @booking.confirmed? ? "Lesson Confirmed!!" : "Lesson Denied"
    redirect_to lessons_path
    #flash[:notice] = "Lesson Confirmed" || "Lesson Denied"
  end

  private

  def booking_policy_authorize
    authorize @booking
  end

  def booking_params
    params.require(:booking).permit(:user_id, :lesson_id, :status)
  end
end
