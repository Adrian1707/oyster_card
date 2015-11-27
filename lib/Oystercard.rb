class Oystercard

  attr_reader :balance, :in_journey

  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
    @max_balance = MAXIMUM_BALANCE
    @in_journey = false
  end

  def top_up(amount)
    fail "Cannot have a balance of more then £#{@max_balance}" if @balance + amount > @max_balance
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    raise "Cannot touch in with no balance" if @balance == 0
    @in_journey = true
  end

  def touch_out
    @in_journey = false
    deduct(2)
  end




end
