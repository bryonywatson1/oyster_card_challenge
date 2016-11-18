require 'journey'

describe Journey do
subject(:journey) { described_class.new }
let(:entry_station) {double :entry_station}
let(:exit_station) {double :exit_station}

  it "has an empty journey history by default" do
    expect(journey.journey_history).to eq ([])
  end

  it "registers if the journey started" do
    journey.register_entry_station(entry_station)
    expect(journey.ongoing?).to eq true
  end

  it "registers if the journey ended" do
    journey.register_entry_station(entry_station)
    journey.forget_entry_station
    expect(journey).not_to be_ongoing
  end

  it "has an exit station" do
    journey.register_exit_station(exit_station)
    expect(journey.exit_station).to eq exit_station
  end

  it "checks whether journey is incomplete" do
    journey.register_entry_station(entry_station)
    expect(journey).not_to be_complete
  end

  it "checks whether journey is complete" do
    journey.register_entry_station(entry_station)
    journey.register_exit_station(exit_station)
    expect(journey).to be_complete
  end

  it "incurs a penalty fare if no exit station" do
    journey.register_entry_station(entry_station)
    expect(journey.fare).to eq 6
  end

  it "incurs a penalty fare if no entry station" do
    journey.register_exit_station(exit_station)
    expect(journey.fare).to eq 6
  end

  it "incurs a minimum fare if journey is complete" do
    journey.register_entry_station(entry_station)
    journey.register_exit_station(exit_station)
    expect(journey.fare).to eq 1
  end

end
