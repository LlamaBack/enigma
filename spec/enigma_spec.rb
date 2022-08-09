require "./lib/enigma"

RSpec.describe Enigma do
  let(:enigma) {Enigma.new}
  it "exists" do
    expect(enigma).to be_an(Enigma)
  end

  it "can encrypt with all arguments" do
    expected_hash = { encryption: "keder ohulw",
                      key: "02715",
                      date: "040895" }
    expect(enigma.encrypt("hello world", "02715", "040895")).to eq(expected_hash)
  end

  it "can decrypt with all arguments" do
    expected_hash = { decryption: "hello world",
                      key: "02715",
                      date: "040895" }
    expect(enigma.decrypt("keder ohulw", "02715", "040895")).to eq(expected_hash)
  end

  xit "can encrypt without given date" do
    expected_hash = { encryption: "keder ohulw",
                      key: "02715",
                      date: "040895" }
    allow_any_instance_of(Data).to recieve(:strftime).and_return
    expect(enigma.encrypt("hello world", "02715")).to eq(expected_hash)
  end
end
