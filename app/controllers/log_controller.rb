class LogController < ApplicationController

  def list
    order = params[:order] || 'asc'
    options = order == 'desc' ? {:order => 'time desc'} : {}
    @logs = Log.find(:all, options)
    @reverse_order = order == 'asc' ? 'desc' : 'asc'
  end

  def delete_all
    Log.delete_all
    redirect_to :action => 'list'
  end

end
