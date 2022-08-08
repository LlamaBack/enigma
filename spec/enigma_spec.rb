require "./lib/enigma"

RSpec.describ Enigma do
  let(:enigma) {Enigma.new}
  it "exists" do
    expect(enigma).to be_an(Enigma)
  end

  it "can encrypt" do
    expected_hash = { encryption: "keder ohulw",
                      key: "02715",
                      date: "040895" }
    expect(enigma.encrypt("hello world", "02715", "040895")).to eq(expected_hash)
  end
end
