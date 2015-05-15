ENV['RAILS_ENV'] ||= 'test'

require 'minitest/autorun'
require 'active_record'
require 'database_cleaner'
require 'pry'
require 'yaml'

require_relative '../models/blog'
require_relative '../models/author'
require_relative '../models/category'
require_relative '../models/post'
require_relative '../models/comment'
require_relative '../models/posttag'
require_relative '../models/tag'

class MiniTest::Test
  def setup
    dbconfig = YAML::load(File.open('db/config.yml'))
    ActiveRecord::Base.establish_connection(dbconfig[ENV['RAILS_ENV']])

    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end
end
