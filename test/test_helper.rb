require 'test/unit'

$LOAD_PATH << File.expand_path('lib')

require 'feed_tools'

# connect
ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => ":memory:"
)

# create tables
load File.expand_path('db/migration.rb')
ActiveRecord::Schema.define(:version => 1) do
  AddFeedToolsTables.up
end

# create models
class CachedFeeds < ActiveRecord::Base
end

FeedTools.configurations[:feed_cache] = CachedFeeds
