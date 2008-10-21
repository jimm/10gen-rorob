class Log < XGen::Mongo::Base

  # Declare Mongo collection name and ivars to be saved
  collection_name "rails_log_#{ENV['RAILS_ENV']}"
  fields :time, :msg

  def self.delete_all
    Log.coll.drop()
  end

  def time
    Time.at(@time)
  end
end
