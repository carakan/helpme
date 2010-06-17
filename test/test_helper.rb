$:.push(File.dirname(__FILE__))
ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'test_help'

require 'factory_girl'
require 'mocha'

require 'shoulda_macros/mongo_mapper'

MongoMapper.connection.drop_database(MongoMapper.database.name)
