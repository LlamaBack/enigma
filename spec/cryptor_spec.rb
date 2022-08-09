RSpec.describe Cryptor do
  let(:dummy_class) { Class.new { extend Cryptor } }
  it "can calculate the finals shifts" do
    expect(dummy_class.final_shifts("02715", "040895")).to eq()
  end
end
