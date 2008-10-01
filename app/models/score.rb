class Score < XGen::Mongo::Base

  fields :for_course, :grade

  def passed?
    @grade >= 2.0
  end

  def to_s
    "#{@for_course}: #@grade"
  end

end
