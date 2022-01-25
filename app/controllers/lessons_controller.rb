class LessonsController < ApplicationController

  before_action :set_lesson, only: [:show, :edit, :update, :destroy]

  def index
    @lessons = Lesson.all
  end
  
  def new
    @lesson = Lesson.new
  end

  def show
    #find the jedi class /lessons/id =>ID comes from the params
    # store in an @ variable
    @booking = Booking.new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  def lesson_params
    params.require(:lesson).permit(:skill_name, :description, :price, :start_at, :end_at)
  end
end
