class Entry
  include Clear::Model

  column date : Time, presence: true
  column revenue : Float64, presence: true
  column ad_cost : Float64, presence: true
  column cogs : Float64, presence: true
  column profit : Float64, presence: true

  before :save, :update_profit

  def roi
    ((profit / ad_cost) * 100).round(2)
  end

  def update_profit
    self.profit = revenue - (ad_cost + cogs)
  end

  def self.total_revenue
    total = 0
    Entry.query.each do |entry|
      total += entry.revenue
    end
    total
  end

  def self.total_ad_cost
    total = 0
    Entry.query.each do |entry|
      total += entry.ad_cost
    end
    total
  end

  def self.total_cogs
    total = 0
    Entry.query.each do |entry|
      total += entry.cogs
    end
    total
  end

  def self.total_profit
    total = 0
    Entry.query.each do |entry|
      total += entry.profit
    end
    total
  end

  def self.avg_roi
    total = 0
    Entry.query.each do |entry|
      total += entry.revenue
    end
    total / Entry.query.count
  end
end
