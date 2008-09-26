class Course < XGen::Mongo::Base
  set_collection :courses, %w(name)

  def to_s
    "Course #{name}"
  end
end
