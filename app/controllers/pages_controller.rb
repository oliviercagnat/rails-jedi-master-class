class PagesController < ApplicationController
  def home
    @lessons = if current_user.side == "Light"
Lesson.includes(:user).where(user: { side: "Light" }).first(5)
else
Lesson.includes(:user).where(user: { side: "Dark" }).first(5)
end
  end
end
