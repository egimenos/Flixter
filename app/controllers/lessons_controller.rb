class LessonsController < ApplicationController
before_action :authenticate_user!
before_action :require_enrollment, only: [:show]
  def show
  end

  private

  def require_enrollment
    if current_user.enrolled_in?(current_lesson.section.course)
      return true
    else
        redirect_to course_path(current_lesson.section.course), alert: 'Please enroll in the course to check the lesons'
    end
  end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end
