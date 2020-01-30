require "spec_helper"
describe Apartment do
  it "insert an appartment and retrieve it" do
    appartment_data = create(:apartment)
    first =  Apartment.first.id
    expect(Apartment.first.id).to eq(first)
  end
end
