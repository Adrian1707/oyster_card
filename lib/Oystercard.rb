class Oystercard

  attr_reader :balance, :in_journey, :station_name

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 2

  def initialize
    @balance = 0
    @max_balance = MAXIMUM_BALANCE
    @min_balance = MINIMUM_BALANCE
    @in_journey = false
  end

  def top_up(amount)
    fail "Cannot have a balance of more then £#{@max_balance}" if @balance + amount > @max_balance
    @balance += amount
  end

  def touch_in(station_name)
    raise "Cannot touch in with balance less then £2" if @balance < @min_balance
    @in_journey = true
    @station_name = station_name
  end

  def touch_out
    raise "Cannot top out if not in journey" if @in_journey == false
    @in_journey = false
    deduct(2)
  end

  private

  def deduct(amount)
    @balance -= amount
  end


end
