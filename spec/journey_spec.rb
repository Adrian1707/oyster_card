require 'Journey'

describe Journey do

  let(:card) { double(:Oystercard)}

  it 'should set journey to true on touch in' do
    card.top_up(10)
    card.touch_in("moorgate")
    expect(subject.travelling).to eq(true)
  end

end
