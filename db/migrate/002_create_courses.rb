class CreateCourses < ActiveRecord::Migration
  def self.up
    create_table :courses do |t|
    end
  end

  def self.down
    drop_table :courses
  end
end
