class LogController < ApplicationController

  def list
    @logs = Log.find(:all)
  end

  def delete_all
    Log.delete_all
    redirect_to :action => 'list'
  end

end
