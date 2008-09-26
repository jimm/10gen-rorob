class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
    end
  end

  def self.down
    drop_table :students
  end
end
