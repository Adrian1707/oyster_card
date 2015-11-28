require 'station'

describe Station do

  # let(:card) {double(:card)}

  it 'should have a name when initialised' do
    station = Station.new(:moorgate)
    expect(station.name).to eq(:moorgate)
  end

end
