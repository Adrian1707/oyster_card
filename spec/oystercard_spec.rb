require 'Oystercard'

describe Oystercard do

  let(:station_name) { double(:station_name) }

  it 'is initialized with a balance of £0' do
    expect(subject.balance).to eq(0)
  end

  it 'can be topped up' do
    subject.top_up(5)
    expect(subject.balance).to eq(5)
  end

  it 'when card touches in, in_journey is set to true' do
    subject.top_up(5)
    subject.touch_in(station_name)
    expect(subject.in_journey).to eq(true)
  end

  it 'raises error is customer tries to top up more then £90' do
    maximum_balance = Oystercard::MAXIMUM_BALANCE
    subject.top_up(maximum_balance)
    expect{subject.top_up(1)}.to raise_error "Cannot have a balance of more then £90"
  end

  context 'when touches out' do

    before do
      subject.top_up(5)
      subject.touch_in(station_name)
      subject.touch_out
    end

    it 'in_journey is set to false' do
      expect(subject.in_journey).to eq(false)
    end

    it 'deducts balance of £2' do
      expect(subject.balance).to eq(3)
    end

  end

  it 'cannot touch in if balance is 0' do
    minimum_balance = Oystercard::MINIMUM_BALANCE
    subject.top_up(minimum_balance-1)
    expect{subject.touch_in(station_name)}.to raise_error "Cannot touch in with balance less then £2"
  end

  it 'cannot touch out if not in journey' do
    subject.top_up(5)
    expect{subject.touch_out}.to raise_error "Cannot top out if not in journey"
  end

  it 'should rememember the station name after touch in' do
    subject.top_up(5)
    subject.touch_in(station_name)
    expect(subject.station_name).to eq(station_name)
  end


end
