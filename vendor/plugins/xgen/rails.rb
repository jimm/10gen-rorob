#--
# Copyright (C) 2008 10gen Inc.
#
# This program is free software: you can redistribute it and/or modify it
# under the terms of the GNU Affero General Public License, version 3, as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License
# for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#++


# RAILS_ENV is set to the name of your cloud environment. If none is specified
# (for example, you are running locally), then 'development' is used. If the
# cloud environment name is "www" (the default production name), then use
# "production" for RAILS_ENV instead.
app_context = $scope['__instance__']
ENV['RAILS_ENV'] = (app_context && app_context.getEnvironmentName()) || 'development'
ENV['RAILS_ENV'] = 'production' if ENV['RAILS_ENV'] == 'www'
$stderr.puts "ENV['RAILS_ENV'] = #{ENV['RAILS_ENV'].inspect}" # DEBUG

# Logging
require 'logger'
require 'xgen/mongo/log_device'
# Default LogDevice capped collection size is 10 Mb.
$stderr.puts "before: RAILS_DEFAULT_LOGGER = #{defined?(RAILS_DEFAULT_LOGGER) ? RAILS_DEFAULT_LOGGER.inspect : 'undefined'}" # DEBUG
RAILS_DEFAULT_LOGGER = Logger.new(XGen::Mongo::LogDevice.new("rails_log_#{ENV['RAILS_ENV']}")) unless defined?(RAILS_DEFAULT_LOGGER)
$stderr.puts "after: RAILS_DEFAULT_LOGGER = #{RAILS_DEFAULT_LOGGER.inspect}" # DEBUG

# XGen::Mongo classes
require 'xgen/mongo'

# Normal Rails configuration
$stderr.puts "before: RAILS_ROOT = #{defined?(RAILS_ROOT) ? RAILS_ROOT.inspect : 'undefined'}" # DEBUG
require File.join($local.getRoot.getPath, "config/environment") unless defined?(RAILS_ROOT)
$stderr.puts "after: RAILS_ROOT = #{RAILS_ROOT.inspect}" # DEBUG
require 'dispatcher'

# Patch Rails
require 'xgen/rails/active_record'

# Session
require 'xgen/rails/mongo_session'
ActionController::CgiRequest::DEFAULT_SESSION_OPTIONS[:database_manager] = XGen::Rails::MongoSession
