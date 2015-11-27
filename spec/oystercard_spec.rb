require 'Oystercard'

describe Oystercard do

  it 'is initialized with a balance of £0' do
    expect(subject.balance).to eq(0)
  end

  it 'can be topped up' do
    subject.top_up(5)
    expect(subject.balance).to eq(5)
  end

  it 'raises error is customer tries to top up more then £90' do
    maximum_balance = Oystercard::MAXIMUM_BALANCE
    subject.top_up(maximum_balance)
    expect{subject.top_up(1)}.to raise_error "Cannot have a balance of more then £90"
  end

  it 'reduces the balance when deduct method is called' do
    subject.top_up(5)
    subject.deduct(1)
    expect(subject.balance).to eq(4)
  end

  it 'when card touches in, in_journey is set to true' do
    subject.top_up(5)
    subject.touch_in
    expect(subject.in_journey).to eq(true)
  end

  it 'when card touches out, in_journey is set to false' do
    subject.top_up(5)
    subject.touch_in
    subject.touch_out
    expect(subject.in_journey).to eq(false)
  end

  it 'cannot touch in if balance is 0' do
    expect{subject.touch_in}.to raise_error "Cannot touch in with no balance"
  end

end
