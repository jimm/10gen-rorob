class LogController < ApplicationController

  def list
    @order = params[:order] || 'asc'
    options = @order == 'desc' ? {:order => 'time desc'} : {}
    @logs = Log.find(:all, options)
  end

  def delete_all
    Log.delete_all
    redirect_to :action => 'list'
  end

end
