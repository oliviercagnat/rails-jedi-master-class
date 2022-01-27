class PagesController < ApplicationController
  def home
    @lessons = if current_user.side == "Light"
Lesson.includes(:user).where(user: { side: "Light" }).first(3)
else
Lesson.includes(:user).where(user: { side: "Dark" }).first(3)
end
  end
end
