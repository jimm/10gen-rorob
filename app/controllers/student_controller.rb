class StudentController < ApplicationController

  def list
    @students = Student.find(:all)
  end

  def create
    @student = Student.new
    render :action => 'edit'
  end

  def edit
    @student = Student.find(params[:id])
  end

  def save
    @student = Student.new(params)
    @student.save
    redirect_to :action => 'list'
  end
end
