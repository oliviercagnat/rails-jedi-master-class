class LessonsController < ApplicationController

  before_action :set_lesson, only: [:show, :edit, :update, :destroy]

  def index
    @lessons = Lesson.all
    @lessons = policy_scope(Lesson)
    @current_user = current_user
  end

  def new
    @lesson = Lesson.new
    authorize @lesson
  end

  def show
    #find the jedi class /lessons/id =>ID comes from the params
    # store in an @ variable
    # @booking = Booking.new (need to create the model)
    authorize @lesson
  end

  def edit
    lesson_policy_authorize
  end

  def create
    lesson_policy_authorize
  end

  def update
    lesson_policy_authorize
  end

  def destroy
    lesson_policy_authorize
  end

  private

  def lesson_policy_authorize
    authorize @lesson
  end

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  def lesson_params
    params.require(:lesson).permit(:skill_name, :description, :price, :start_at, :end_at, :skill_picture)
  end
end
