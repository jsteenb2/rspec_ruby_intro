class StockPicker
  def initialize(array)
    raise(ArgumentError) unless array.all? { |elem| elem.is_a?(Fixnum)}
    @prices = array
  end

  def pick_stocks

    buy_tracker = 0
    sell_tracker = 1
    
    max_profit = 0
    buy = 0
    
    while buy < @prices.length - 1
      sell = buy + 1
      while sell < @prices.length
        profit = @prices[sell] - @prices[buy]
        
        if profit > max_profit
          max_profit = profit
          buy_tracker = buy
          sell_tracker = sell
        end

        sell += 1
      end
      buy += 1
    end
    [buy_tracker, sell_tracker]
  end
end
