require "kemal"
require "clear"
require "../src/**"

Clear::SQL.init("default", "postgres://fps:fps@0.0.0.0:54320/cost_profit_db", connection_pool_size: 5)

get "/" do
  "Hello World!"
end

get "/app" do
  render "src/views/cost_profit_app.ecr"
end

get "/calculate_form" do |env|
  render "src/views/calculate_form.ecr"
end

get "/calculate" do |env|
  date = env.params.query["date"]
  year, month, day = date.split("-").map { |x| x.to_i }
  revenue = env.params.query["revenue"]
  ad_cost = env.params.query["ad_cost"]
  cogs = env.params.query["cogs"]
  entry = Entry.new
  entry.date = Time.utc(year, month, day)
  entry.revenue = revenue.to_f
  entry.ad_cost = ad_cost.to_f
  entry.cogs = cogs.to_f
  if entry.save
    render "src/views/calculate.ecr"
  else
    "There was an error saving the entry"
  end
end

Kemal.run
