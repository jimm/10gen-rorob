class Student < XGen::Mongo::Base
  set_collection :students, %w(name email address scores)

  def initialize(row=nil)
    super
    @scores = []
    @address = Address.new
  end

  def summary
    return <<EOS
#{name}
#{address}
#{scores.each { |s| s.to_s + "\n" }}
EOS
  end

  def add_Score(course, grad)
    @scores << Score.new(course, grade)
  end
end
