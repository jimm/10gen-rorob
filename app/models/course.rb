class Course < XGen::Mongo::Base

  # Declare Mongo collection name and ivars to be saved
  set_collection :courses, %w(name)

  def to_s
    "Course #{name}"
  end
end
