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
end
