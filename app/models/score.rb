class Score

  def initialize(course, grade)
    @for_course, @grade = course, grade
  end

  def passed?
    @grade >= 2.0
  end

  def to_s
    "#{@for_course}: #@grade"
  end

end
