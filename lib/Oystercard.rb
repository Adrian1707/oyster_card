class Oystercard

  attr_reader :balance

  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
    @max_balance = MAXIMUM_BALANCE
  end

  def top_up(amount)
    fail "Cannot have a balance of more then £#{@max_balance}" if @balance + amount > @max_balance
    @balance += amount
  end

end
