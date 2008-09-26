require File.dirname(__FILE__) + '/../test_helper'
require 'course_controller'

# Re-raise errors caught by the controller.
class CourseController; def rescue_action(e) raise e end; end

class CourseControllerTest < Test::Unit::TestCase
  def setup
    @controller = CourseController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
