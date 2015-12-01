class Oystercard

  attr_reader :balance, :in_journey, :entry_station, :exit_station, :journeys

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 2

  def initialize
    @balance = 0
    @max_balance = MAXIMUM_BALANCE
    @min_balance = MINIMUM_BALANCE
    @in_journey = false
    @journeys = {}
  end

  def top_up(amount)
    fail "Cannot have a balance of more then £#{@max_balance}" if @balance + amount > @max_balance
    @balance += amount
  end

  def touch_in(entry_station)
    raise "Cannot touch in with balance less then £2" if @balance < @min_balance
    @entry_station = entry_station
    @in_journey = true
    @journeys[:entry_station] = entry_station
  end

  def touch_out(exit_station)
    raise "Cannot top out if not in journey" if @in_journey == false
    @entry_station = nil
    @in_journey = false
    deduct(@min_balance)
    @journeys[:exit_station] = exit_station
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
