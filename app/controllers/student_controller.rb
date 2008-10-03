class StudentController < ApplicationController

  def list
    @students = Student.find(:all, :order => :name)
  end

  def create
    @student = Student.new
    render :action => 'edit'
  end

  def edit
    @student = Student.find(params[:id])
    @courses = Course.find(:all)
  end

  def save
    @student = Student.new(params)
    @student.save
    redirect_to :action => 'list'
  end

  def add_grade
    student = Student.find(params[:id])
    student.add_score(params['course[course_id]'], params[:grade])
    student.save
    redirect_to :action => 'edit', :id => student.id
  end

  def delete
    Students.delete(params[:id])
    redirect_to :action => 'list'
  end
end
