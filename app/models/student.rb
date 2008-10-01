class Student < XGen::Mongo::Base

  collection_name :students
  fields :name, :email
  has_one :address
  has_many :scores, :class_name => "Score"

  def initialize(row=nil)
    super
    @address ||= Address.new
  end

  def summary
    return <<EOS
#{name}
#{address}
#{scores.each { |s| s.to_s + "\n" }}
EOS
  end

  def add_score(course, grad)
    @scores << Score.new(course, grade)
  end
end
