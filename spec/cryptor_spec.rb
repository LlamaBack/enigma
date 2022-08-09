require './lib/cryptor'
RSpec.describe Cryptor do
  let(:dummy_class) { Class.new { extend Cryptor } }
  let(:char_set) {("a".."z").to_a << " "}
  it "can calculate the finals shifts" do
    expect(dummy_class.final_shifts("02715", "040895")).to eq([3, 27, 73, 20])
  end

  it "can encrypt a message" do
    expect(dummy_class.encryption("hello", [3,27,73,20], char_set)).to eq("keder")
  end

end
