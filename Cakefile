require "clear"
require "./src/db/**"

task :migrate do
  puts "Running migration..."
  Clear::SQL.init("default", "postgres://fps:fps@0.0.0.0:54320/cost_profit_db", connection_pool_size: 5)
  Clear::Migration::Manager.instance.apply_all
  puts "Done!"
end
