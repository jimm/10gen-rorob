require File.dirname(__FILE__) + '/../test_helper'
require 'student_controller'

# Re-raise errors caught by the controller.
class StudentController; def rescue_action(e) raise e end; end

class StudentControllerTest < Test::Unit::TestCase
  def setup
    @controller = StudentController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
