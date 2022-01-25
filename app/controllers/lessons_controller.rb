class LessonsController < ApplicationController

  def new
    @lesson = Lesson.new
  end

  def show
    #find the jedi class /lessons/id =>ID comes from the params
    # store in an @ variable
    @booking = Booking.new
  end
end
