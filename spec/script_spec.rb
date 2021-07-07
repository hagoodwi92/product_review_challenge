require 'rspec'
require './test'

describe (Test) do
  describe("reject") do 
    it 'should return rejected list in array' do
      script = Test.new()
      expect(script.reject()).to(eq(["basket of kittens", "mug"]))
    end
end
describe("accept") do 
  it 'should return rejected list in array' do
    script = Test.new()
    expect(script.accept()).to(eq(['holographic t-shirt',
    'keychain']))
  end
end
end
