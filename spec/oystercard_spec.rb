require 'spec_helper'
require 'oyster_card'

describe OysterCard do
  let(:uuid_generator) { double(uuid: "uid") }
  let(:name)           { "TFLer" }
  subject(:oystercard) { OysterCard.new(uuid_generator, name) }

  it "has a unique identifier" do
    expect(subject.uuid).to eq("uid")
  end

  it "has an owner name" do
    expect(subject.owner_name).to eq(name)
  end
end
