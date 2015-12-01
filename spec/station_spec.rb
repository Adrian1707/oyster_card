require 'Station'

describe Station do

  let(:station) {Station.new("moorgate", 1)}
  
  it 'should have a name when initialised' do
    expect(station.name).to eq("moorgate")
  end

  it 'should have a zone when initialised' do
    expect(station.zone).to eq(1)
  end

end
