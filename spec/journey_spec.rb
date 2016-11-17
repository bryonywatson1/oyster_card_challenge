require 'journey'

describe Journey do
subject(:journey) { described_class.new }
let(:entry_station) {double :entry_station}

  it "has an empty journey history by default" do
    expect(journey.journey_history).to eq ([])
  end

  it "registers if the journey started" do
    journey.register_entry_station(:entry_station)
    expect(journey.ongoing?).to eq true
  end

  it "remembers one journey" do
      journey.register_entry_station(:entry_station)
      journey.register_journey(:exit_station)
    expect(journey.journey_history).to eq ([{:entry_station=>:exit_station}])
  end

  it "registers if the journey ended" do
    journey.register_entry_station(:entry_station)
    journey.forget_entry_station
    expect(journey.ongoing?).to eq false
  end

#  if entry_station != nil then deduct 6 and {entry_Station=>nil}


end
