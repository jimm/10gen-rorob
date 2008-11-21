class Score < XGen::Mongo::Base

  field :grade
  has_one :for_course, :class_name => 'Course' # Mongo will store course db reference, not duplicate object
  belongs_to :student

  def passed?
    @grade >= 2.0
  end

  def to_s
    "#{@for_course}: #@grade"
  end

end
