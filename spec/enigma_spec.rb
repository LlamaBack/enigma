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

  it "can encrypt without given date" do
    expected_hash = { encryption: "ifmmpaxpsme",
                      key: "02715",
                      date: "040895" }
    shifts = [1, 1, 1, 1]
    allow(enigma).to receive(:final_shifts).and_return(shifts)
    allow_any_instance_of(Date).to receive(:strftime).and_return("040895")
    expect(enigma.encrypt("hello world", "02715")).to eq(expected_hash)
  end

  it "can decrypt without given date" do
    expected_hash = { decryption: "hello world",
                      key: "02715",
                      date: "040895" }
    shifts = [1, 1, 1, 1]
    allow(enigma).to receive(:final_shifts).and_return(shifts)
    allow_any_instance_of(Date).to receive(:strftime).and_return("040895")
    expect(enigma.decrypt("ifmmpaxpsme", "02715")).to eq(expected_hash)
  end

  it "can encrypt with char not in set" do
    expected_hash = { encryption: "igm!mqa!xqsne",
                      key: "02715",
                      date: "040895" }
    shifts = [1, 2, 1, 2]
    allow(enigma).to receive(:final_shifts).and_return(shifts)
    allow_any_instance_of(Date).to receive(:strftime).and_return("040895")
    expect(enigma.encrypt("hel!lo !world", "02715")).to eq(expected_hash)
  end
end
