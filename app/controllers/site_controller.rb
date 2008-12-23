class SiteController < ApplicationController

  def index
  end

  def about
  end

  def help
  end

  def stest
    @count = session[:count] || 0
    @count += 1
    session[:count] = @count
  end

  def gemtest
    require 'midilib'
  end
end
