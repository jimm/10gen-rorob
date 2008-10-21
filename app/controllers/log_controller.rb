class LogController < ApplicationController

  def list
    @logs = Log.find(:all)
  end
end
