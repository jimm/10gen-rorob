class CourseController < ApplicationController

  def list
    @courses = Course.find(:all)
  end

  def create
    @course = Course.new
    render :action => 'edit'
  end

  def edit
    @course = Course.find(params[:id])
  end

  def save
    @course = Course.new(params)
    @course.save
    redirect_to :action => 'list'
  end
end
